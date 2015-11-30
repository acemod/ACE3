/*
 * Author: KoffeinFlummi, Glowbal
 * Cache a handleDamage call to execute it 3 frames later
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <STRING>
 * 5: Current damage to be returned <NUMBER>
 *
 * Return Value:
 * <nil>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_hitSelections", "_hitPoints", "_impactVelocity", "_newDamage", "_cache_hitpoints", "_cache_projectiles", "_cache_params", "_cache_damages"];
params ["_unit", "_selectionName", "_damage", "_source", "_projectile"];
TRACE_8("ACE_DEBUG: HandleDamage_Caching Called",_unit, _selectionName, _damage, _source, _projectile,GVAR(SELECTIONS),GVAR(HITPOINTS),damage _unit);
_hitSelections = GVAR(SELECTIONS);
_hitPoints = GVAR(HITPOINTS);

// Calculate change in damage.
_newDamage = _damage - (damage _unit);
if (_selectionName in _hitSelections) then {
    _newDamage = _damage - (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selectionName)));
};

//_damage = _damage + _newDamage;

// Check for vehicle crash
if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {isNull _source} && {_projectile == ""} && {_selectionName == ""}) then {
    if (GVAR(enableVehicleCrashes)) then {
        _selectionName = _hitSelections select (floor(random(count _hitSelections)));
        _projectile = "vehiclecrash";
        _this set [1, _selectionName];
        _this set [4, _projectile];
    };
};

// Handle falling damage
_impactVelocity = (velocity _unit) select 2;
if (_impactVelocity < -5 && {vehicle _unit == _unit}) then {
    _unit setVariable [QGVAR(isFalling), true];
    _unit setVariable [QGVAR(impactVelocity), _impactVelocity];
};
if (_unit getVariable [QGVAR(isFalling), false]) then {
    if !(_selectionName in ["", "leg_l", "leg_r"]) then {
        if (_selectionName == "body") then {
            _newDamage = _newDamage * abs(_unit getVariable [QGVAR(impactVelocity), _impactVelocity]) / 50;
        } else {
            _newDamage = _newDamage * 0.5;
        };
    } else {
        if (_selectionName == "") then {
            _selectionName = ["leg_l", "leg_r"] select (floor(random 2));
            _this set [1, _selectionName];
        };
        _newDamage = _newDamage * 0.7;
    };
    _projectile = "falling";
    _this set [4, "falling"];
};

// Finished with the current frame, reset variables
// Note: sometimes handleDamage spans over 2 or even 3 frames.
if (diag_frameno > (_unit getVariable [QGVAR(frameNo_damageCaching), -3]) + 2) then {
    _unit setVariable [QGVAR(frameNo_damageCaching), diag_frameno];

    // handle the cached damages 3 frames later
    [{
        private ["_args", "_params"];
        params ["_args", "_idPFH"];
        _args params ["_unit", "_frameno"];
        if (diag_frameno >= _frameno + 2) then {
            _unit setDamage 0;

            if (GVAR(level) < 2 || {!([_unit] call FUNC(hasMedicalEnabled))}) then {
                [_unit] call FUNC(handleDamage_basic);
            } else {
                _cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
                _cache_damages = _unit getVariable QGVAR(cachedDamages);
                {
                    _params = _x + [_cache_damages select _foreachIndex];
                    _params call FUNC(handleDamage_advanced);
                } foreach _cache_params;
                [_unit] call FUNC(handleDamage_advancedSetDamage);
            };
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, [_unit, diag_frameno] ] call CBA_fnc_addPerFrameHandler;

    _unit setVariable [QGVAR(cachedProjectiles), []];
    _unit setVariable [QGVAR(cachedHitPoints), []];
    _unit setVariable [QGVAR(cachedDamages), []];
    _unit setVariable [QGVAR(cachedHandleDamageParams), []];
};

// Caching of the damage events
if (_selectionName != "") then {
    _cache_projectiles = _unit getVariable QGVAR(cachedProjectiles);
    private ["_index","_otherDamage"];
    _index = _cache_projectiles find _projectile;
    // Check if the current projectile has already been handled once
    if (_index >= 0 && {_projectile != "falling"}) exitWith {
        _cache_damages = _unit getVariable QGVAR(cachedDamages);
        // Find the previous damage this projectile has done
        _otherDamage = (_cache_damages select _index);

        // Take the highest damage of the two
        if (_newDamage > _otherDamage) then {
            _cache_params = _unit getVariable QGVAR(cachedHandleDamageParams);
            _cache_hitpoints = _unit getVariable QGVAR(cachedHitPoints);

            private ["_hitPoint", "_restore"];
            // Restore the damage before the previous damage was processed
            _hitPoint = _cache_hitpoints select _index;
            _restore = ((_unit getHitPointDamage _hitPoint) - _otherDamage) max 0;
            _unit setHitPointDamage [_hitPoint, _restore];

            _cache_hitpoints set [_index, (_hitPoints select (_hitSelections find _selectionName))];
            _cache_damages set [_index, _newDamage];
            _cache_params set[_index, _this];

            _unit setVariable [QGVAR(cachedProjectiles), _cache_projectiles];
            _unit setVariable [QGVAR(cachedHitPoints), _cache_hitpoints];
            _unit setVariable [QGVAR(cachedDamages), _cache_damages];
            _unit setVariable [QGVAR(cachedHandleDamageParams), _cache_params];
        };
    };

    _cache_hitpoints = _unit getVariable QGVAR(cachedHitPoints);
    _cache_damages = _unit getVariable QGVAR(cachedDamages);
    _cache_params = _unit getVariable QGVAR(cachedHandleDamageParams);

    // This is an unhandled projectile
    _cache_projectiles pushBack _projectile;
    _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
    _cache_damages pushBack _newDamage;
    _cache_params pushBack _this;

    // Store the new cached values
    _unit setVariable [QGVAR(cachedProjectiles), _cache_projectiles];
    _unit setVariable [QGVAR(cachedHitPoints), _cache_hitpoints];
    _unit setVariable [QGVAR(cachedDamages), _cache_damages];
    _unit setVariable [QGVAR(cachedHandleDamageParams), _cache_params];
};

TRACE_8("ACE_DEBUG: HandleDamage_Caching",_unit, _newDamage, _cache_params, _cache_damages, _unit getVariable QGVAR(cachedProjectiles), _unit getVariable QGVAR(cachedHitPoints), _unit getVariable QGVAR(cachedDamages), _unit getVariable QGVAR(cachedHandleDamageParams));

_newDamage
