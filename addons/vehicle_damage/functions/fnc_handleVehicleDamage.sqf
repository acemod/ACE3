#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Process vehicle hit.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: The hitpoint which got hit <STRING>
 * 2: The index of what got hit <NUMBER>
 * 3: The damage that the new part took <NUMBER>
 * 4: Person who hit vehicle <OBJECT>
 * 5: Damage before hit <NUMBER>
 * 6: Damage after hit <NUMBER>
 * 7: Projectile <OBJECT>
 * 8: Selection that got hit <STIRNG>
 *
 * Return Value:
 * Whether or not to continue handling last frame's damage
 *
 * Example:
 * [ace_vehicle_damage_fnc_handleTankDamage, tank1, "Hit_Engine", 12]] call CBA_fnc_execNextFrame
 *
 * Public: No
 */

params["_vehicle", "_hitPoint", "_hitIndex", "_injurer", "_oldDamage", "_newDamage", "_projectile", "_selection"];
TRACE_6("handleVehicleDamage",_vehicle,_hitPoint,_hitIndex,_injurer,_oldDamage,_newDamage);
if !(alive _vehicle) exitWith {
    private _eventHandler = _vehicle getVariable[QGVAR(handleDamage), nil];
    if !(isNil "_eventHandler") then {
        _vehicle removeEventHandler ["handleDamage", _eventHandler];
    };
    LOG_1("Vehicle [%1] no longer alive",_vehicle);
    true
};

_hitPoint = toLower _hitPoint;
private _hitpointHash = _vehicle getVariable [QGVAR(hitpointHash), []];
private _type = if (_hitpointHash isEqualTo []) then {
    "exit"
} else {
    ([_hitpointHash, _hitPoint] call CBA_fnc_hashGet) select 0
};

if (isNil "_type") then {
    _type = "exit";
};

// generic structural damage will be transfered into hull damage for simulation's sake
private _structural = false;
if (_selection isEqualTo "") then {
    _type = "hull";
    _hitPoint = "hithull";
    _structural = true;
    TRACE_1("structural damage",_selection);
    _newDamage = abs _newDamage;
};

if (_type isEqualTo "exit") exitWith { LOG_1("No relevant hitpoints hit [%1]. Exiting",_hitPoint); true };

// Ignore multiple hits at the same time
private _ignoreHit = false;
private _ignoreBailCheck = false;
private _multHit = _vehicle getVariable [QGVAR(hitTime), nil];
if (isNil "_multHit") then {
    _vehicle setVariable[QGVAR(hitTime), [CBA_missionTime, _injurer, [_hitPoint]]];
} else {
    private _hitPointInOldArray = _hitPoint in (_multHit select 2);
    private _withinTime = (CBA_missionTime <= (_multHit select 0) + CONST_TIME) && { _injurer == (_multHit select 1) };
    if (_hitPointInOldArray && _withinTime) then {
        _ignoreHit = true;
    } else {   
        // If the hitpoint isnt in the old array then that means that the time expired and a new array should be generated
        if !(_hitPointInOldArray) then {
            private _oldHitPoints = _multHit select 2;
            _oldHitPoints pushBack _hitPoint;
            _vehicle setVariable [QGVAR(hitTime), [CBA_missionTime, _injurer, _oldHitPoints]];
            _ignoreBailCheck = true;
        } else {
            _vehicle setVariable [QGVAR(hitTime), [CBA_missionTime, _injurer, [_hitPoint]]];
        };
    };
};
if (_ignoreHit && !_structural) exitWith {
    LOG_3("Ignoring multiple hits done to vehicle [%1] by [%2] -- hitpoint [%3].",_vehicle,_injurer,_hitPoint);
    true
};
LOG_3("Processing hit done to vehicle [%1] by [%2] at time [%3].",_vehicle,_injurer,CBA_missionTime);

if !([_vehicle, _projectile, _hitIndex, _newDamage, [_hitpointHash, _hitPoint] call CBA_fnc_hashGet, _injurer] call FUNC(processHit)) exitWith { false };

private _canMove = _vehicle getVariable[QGVAR(canMove), true];
private _canShoot = _vehicle getVariable[QGVAR(canShoot), true];

if !(_ignoreBailCheck) then {
    [_vehicle, _canMove, _canShoot] call FUNC(handleBail);
};

true
