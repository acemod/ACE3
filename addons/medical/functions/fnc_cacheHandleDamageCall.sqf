/**
 * fnc_cacheHandleDamageCall.sqf
 * @Descr: Cache a handleDamage call to execute it 3 frames later
 * @Author: KoffeinFlummi
 *
 * @Arguments: [unit OBJECT, selection STRING, damagE NUMBER, source OBJECT, projectile STRING (Could be an OBJECT on occasion)]
 * @Return:
 * @PublicAPI: false
 */


#include "script_component.hpp"

private ["_unit", "_selectionName","_damage", "_source","_projectile","_hitSelections","_hitPoints","_newDamage","_cache_hitpoints","_cache_projectiles","_cache_params","_cache_damages"];
_unit          = _this select 0;
_selectionName = _this select 1;
_damage        = _this select 2;
_source        = _this select 3;
_projectile    = _this select 4;

_hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
_hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];

// Calculate change in damage.
_newDamage = _damage - (damage _unit);
if (_selectionName in _hitSelections) then {
    _newDamage = _damage - (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selectionName)));
};

// we want to move damage to another selection; have to do it ourselves.
// this is only the case for limbs, so this will not impact the killed EH.
if (_selectionName != (_this select 1)) then {
    _unit setHitPointDamage [_hitPoints select (_hitSelections find _selectionName), _damage + _newDamage];
    _newDamage = 0;
};
_damage = _damage + _newDamage;

// From AGM medical:
// Exclude falling damage to everything other than legs; reduce structural damage.
if (((velocity _unit) select 2 < -5) &&  (vehicle _unit == _unit)) then {
    _unit setVariable [QGVAR(isFalling), True];
};
if (_unit getVariable [QGVAR(isFalling), false] && !(_selectionName in ["", "leg_l", "leg_r"])) exitWith {};
if (_unit getVariable [QGVAR(isFalling), false]) then {
    _newDamage = _newDamage * 0.7;
};

// Finished with the current frame, reset variables
// Note: sometimes handleDamage spans over 2 or even 3 frames.
if (diag_frameno > (_unit getVariable [QGVAR(frameNo_damageCaching), -3]) + 2) then {
    _unit setVariable [QGVAR(frameNo_damageCaching), diag_frameno];

    // handle the cached damages 3 frames later
    [{
        private ["_args","_unit","_frameNo"];
        _args = _this select 0;
        _unit = _args select 0;
        _frameNo = _args select 1;

        if (diag_frameno > _frameNo + 2) then {
            _cache_projectiles = _unit getVariable [QGVAR(cachedProjectiles), []];
            _cache_hitpoints = _unit getVariable [QGVAR(cachedHitPoints), []];
            _cache_damages = _unit getVariable [QGVAR(cachedDamages), []];
            _cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
            {
                if (typeName _x == typeName "") then {
                    (_cache_params select _foreachIndex) call FUNC(handleDamage);
                };
            }foreach _cache_projectiles;
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
    }, 0, [_unit, diag_frameno] ] call CBA_fnc_addPerFrameHandler;

    _unit setVariable [QGVAR(cachedProjectiles), []];
    _unit setVariable [QGVAR(cachedHitPoints), []];
    _unit setVariable [QGVAR(cachedDamages), []];
    _unit setVariable [QGVAR(cachedHandleDamageParams), []];
};

// Make sure there's only one damaged selection per projectile per frame.
_cache_projectiles = _unit getVariable QGVAR(cachedProjectiles);
_cache_hitpoints = _unit getVariable QGVAR(cachedHitPoints);
_cache_damages = _unit getVariable QGVAR(cachedDamages);
_cache_params = _unit getVariable QGVAR(cachedHandleDamageParams);

// Caching of the damage events
if (_selectionName != "") then {

    // Check if the current projectile has already been handled once
    if (_projectile in _cache_projectiles) then {
        private ["_index","_otherDamage"];
        // if it has been handled, find the index in the cache
        _index = _cache_projectiles find _projectile;

        // Find the previous damage this projectile has done
        _otherDamage = (_cache_damages select _index);

        // Take the highest damage of the two
        if (_otherDamage > _newDamage) then {
            _newDamage = 0;
        } else {
            private ["_hitPoint", "_restore"];
            // Restore the damage before the previous damage was processed
            _hitPoint = _cache_hitpoints select _index;
            _restore = ((_unit getHitPointDamage _hitPoint) - _otherDamage) max 0;
            _unit setHitPointDamage [_hitPoint, _restore];

            // Make entry unfindable and add the new damage cache
            _cache_projectiles set [_index, objNull];
            _cache_projectiles pushBack _projectile;
            _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
            _cache_damages pushBack _newDamage;
            _cache_params pushBack [_unit, _selectionName, _damage, _source, _projectile];
        };
    } else {
        // This is an unhandled projectile
        _cache_projectiles pushBack _projectile;
        _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
        _cache_damages pushBack _newDamage;
        _cache_params pushBack [_unit, _selectionName, _damage, _source, _projectile];
    };
};

// Store the new cached values
_unit setVariable [QGVAR(cachedProjectiles), _cache_projectiles];
_unit setVariable [QGVAR(cachedHitPoints), _cache_hitpoints];
_unit setVariable [QGVAR(cachedDamages), _cache_damages];
_unit setVariable [QGVAR(cachedHandleDamageParams), _cache_params];
