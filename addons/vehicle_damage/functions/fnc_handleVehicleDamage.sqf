#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Process vehicle hit.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: The hitpoint which got hit <STRING>
 * 2: The index of what got hit <NUMBER>
 * 3: The damage that the new part took <NUMBER>
 * 4: Source of damage <OBJECT>
 * 5: Instigator <OBJECT>
 * 6: Damage before hit <NUMBER>
 * 7: Damage after hit <NUMBER>
 * 8: Projectile <OBJECT>
 * 9: Selection that was hit <STIRNG>
 *
 * Return Value:
 * Whether or not to continue handling last frame's damage <BOOL>
 *
 * Example:
 * [ace_vehicle_damage_fnc_handleVehicleDamage, tank1, "Hit_Engine", 12]] call CBA_fnc_execNextFrame
 *
 * Public: No
 */

params ["_vehicle", "_hitPoint", "_hitIndex", "_source", "_instigator", "_oldDamage", "_newDamage", "_projectile", "_selection"];
TRACE_6("handleVehicleDamage",_vehicle,_hitPoint,_hitIndex,_source,_oldDamage,_newDamage);

if (!alive _vehicle) exitWith {
    private _eventHandler = _vehicle getVariable [QGVAR(handleDamage), nil];

    if (!isNil "_eventHandler") then {
        _vehicle removeEventHandler ["handleDamage", _eventHandler];
    };

    TRACE_1("Vehicle [%1] no longer alive",_vehicle);

    true
};

_hitPoint = toLowerANSI _hitPoint;
private _hitPointHash = GVAR(vehicleClassesHitPointHash) getOrDefault [typeOf _vehicle, createHashMap];
private _type = (_hitPointHash getOrDefault [_hitPoint, []]) select 0;

// Generic structural damage will be transfered into hull damage for simulation's sake
private _structural = false;

if (_selection == "") then {
    _type = "hull";
    _hitPoint = "hithull";
    _structural = true;

    TRACE_1("structural damage",_selection);

    _newDamage = abs _newDamage;
};

if (isNil "_type") exitWith {
    TRACE_1("No relevant hitpoints hit [%1]. Exiting",_hitPoint);

    true
};

// Ignore multiple hits at the same time
private _ignoreHit = false;
private _ignoreBailCheck = false;
private _multHit = _vehicle getVariable [QGVAR(hitTime), nil];

if (isNil "_multHit") then {
    _vehicle setVariable [QGVAR(hitTime), [CBA_missionTime, _source, [_hitPoint]]];
} else {
    private _hitPointInOldArray = _hitPoint in (_multHit select 2);
    private _withinTime = (CBA_missionTime <= (_multHit select 0) + CONST_TIME) && {_source == (_multHit select 1)};

    if (_hitPointInOldArray && _withinTime) then {
        _ignoreHit = true;
    } else {
        // If the hitpoint isnt in the old array then that means that the time expired and a new array should be generated
        if (!_hitPointInOldArray) then {
            private _oldHitPoints = _multHit select 2;
            _oldHitPoints pushBack _hitPoint;
            _vehicle setVariable [QGVAR(hitTime), [CBA_missionTime, _source, _oldHitPoints]];

            _ignoreBailCheck = true;
        } else {
            _vehicle setVariable [QGVAR(hitTime), [CBA_missionTime, _source, [_hitPoint]]];
        };
    };
};

if (_ignoreHit && !_structural) exitWith {
    TRACE_3("Ignoring multiple hits done to vehicle [%1] by [%2] -- hitpoint [%3].",_vehicle,_source,_hitPoint);

    true
};

TRACE_3("Processing hit done to vehicle [%1] by [%2] at time [%3].",_vehicle,_source,CBA_missionTime);

if !([_vehicle, _projectile, _hitIndex, _newDamage, _hitPoint, _source, _instigator] call FUNC(processHit)) exitWith {false};

if (!_ignoreBailCheck) then {
    _vehicle call FUNC(handleBail);
};

true
