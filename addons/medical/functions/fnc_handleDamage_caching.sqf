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
 * 5: HitPointIndex (-1 for structural) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "leg", 2, kevin, "bullet", -1] call ACE_medical_fnc_handleDamage_caching
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_selectionName", "_damage", "_source", "_projectile", "_hitPointIndex"];

private _hitSelections = GVAR(SELECTIONS);

// Calculate change in damage - use getHitIndex because selection is translated (hitdiaphragm->body)
private _newDamage = _damage - (damage _unit);
if (_hitPointIndex >= 0) then {_newDamage = _damage - (_unit getHitIndex _hitPointIndex)};

TRACE_7("ACE_DEBUG: HandleDamage_Caching Called",_unit, _selectionName, _damage, _source, _projectile,_hitPointIndex,_newDamage);

// Check for vehicle crash
private _vehicle = vehicle _unit;
if ((_vehicle != _unit) && {!(_vehicle isKindOf "StaticWeapon")} && {_source in [objNull, driver _vehicle, _vehicle]} && {_projectile == ""} && {_selectionName == ""}) then {
    if (GVAR(enableVehicleCrashes)) then {
        _selectionName = selectRandom _hitSelections;
        _projectile = "vehiclecrash";
        _this set [1, _selectionName];
        _this set [4, _projectile];
    };
};

// Handle falling damage
private _impactVelocity = (velocity _unit) select 2;
if (_impactVelocity < -5 && {_vehicle == _unit}) then {
     TRACE_1("Starting isFalling", time);
    _unit setVariable [QGVAR(isFalling), true];
    _unit setVariable [QGVAR(impactVelocity), _impactVelocity];
} else {
    if ((_unit getVariable [QGVAR(isFalling), false]) && {diag_frameno > (_unit getVariable [QGVAR(frameNo_damageCaching), -3]) + 2}) then {
        TRACE_1("Ending isFalling", time);
        _unit setVariable [QGVAR(isFalling), false];
    };
};

if (_unit getVariable [QGVAR(isFalling), false]) then {
    if !(_selectionName in ["", "leg_l", "leg_r"]) then {
        if (_selectionName == "body") then {
            _newDamage = _newDamage * abs(_unit getVariable [QGVAR(impactVelocity), _impactVelocity]) / 50;
        } else {
            _newDamage = _newDamage * 0.5;
        };
        if (_newDamage < 0.075) then {_newDamage = 0;}; //Filter minor falling damage to non-leg hitpoints
    } else {
        if (_selectionName == "") then {
            _selectionName = selectRandom ["leg_l", "leg_r"];
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
        params ["_args", "_idPFH"];
        _args params ["_unit", "_frameno"];
        if (diag_frameno >= _frameno + 2) then {
            _unit setDamage 0;
            private _cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
            private _cache_damages = _unit getVariable QGVAR(cachedDamages);
            {
                (_x + [_cache_damages select _forEachIndex]) call FUNC(handleDamage_advanced);
            } forEach _cache_params;
            [_unit] call FUNC(handleDamage_advancedSetDamage);
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
    private _cache_projectiles = _unit getVariable QGVAR(cachedProjectiles);
    private _index = _cache_projectiles find _projectile;

    // Check if the current projectile has already been handled once
    if (_index >= 0 && {_projectile != "falling"}) exitWith {

        private _cache_damages = _unit getVariable QGVAR(cachedDamages);
        private _otherDamage = (_cache_damages select _index); // Find the previous damage this projectile has done

        // Take the highest damage of the two
        if (_newDamage > _otherDamage) then {
            private _cache_params = _unit getVariable QGVAR(cachedHandleDamageParams);
            private _cache_hitpoints = _unit getVariable QGVAR(cachedHitPoints);

            // Restore the damage before the previous damage was processed
            private _hitPoint = _cache_hitpoints select _index;
            private _restore = ((_unit getHitIndex _hitPoint) - _otherDamage) max 0;
            _unit setHitIndex [_hitPoint, _restore];

            _cache_hitpoints set [_index, _hitPointIndex];
            _cache_damages set [_index, _newDamage];
            _cache_params set[_index, _this];

            _unit setVariable [QGVAR(cachedProjectiles), _cache_projectiles];
            _unit setVariable [QGVAR(cachedHitPoints), _cache_hitpoints];
            _unit setVariable [QGVAR(cachedDamages), _cache_damages];
            _unit setVariable [QGVAR(cachedHandleDamageParams), _cache_params];
        };
    };

    private _cache_hitpoints = _unit getVariable QGVAR(cachedHitPoints);
    private _cache_damages = _unit getVariable QGVAR(cachedDamages);
    private _cache_params = _unit getVariable QGVAR(cachedHandleDamageParams);

    // This is an unhandled projectile
    _cache_projectiles pushBack _projectile;
    _cache_hitpoints pushBack _hitPointIndex;
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
