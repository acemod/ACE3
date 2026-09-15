#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Process vehicle hit.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hit point <STRING>
 * 2: Hit index <NUMBER>
 * 3: Selection <STRING>
 * 4: Added damage to part <NUMBER>
 * 5: Projectile <STRING>
 * 6: Source of damage <OBJECT>
 * 7: Person who caused damage <OBJECT>
 *
 * Return Value:
 * Whether or not to continue handling last frame's damage <BOOL>
 *
 * Example:
 * [ace_vehicle_damage_fnc_handleVehicleDamage, [cursorObject, "HitEngine", 12, "hit_engine_point", 0.25, projectile, player, player]] call CBA_fnc_execNextFrame
 *
 * Public: No
 */

params ["_vehicle", "_hitPoint", "_hitIndex", "_selection", "_addedDamage", "_projectile", "_source", "_instigator"];
TRACE_8("handleVehicleDamage",_vehicle,_hitPoint,_hitIndex,_selection,_addedDamage,_projectile,_source,_instigator);

if (!alive _vehicle) exitWith {
    private _handleDamageEH = _vehicle getVariable [QGVAR(handleDamage), nil];

    if (!isNil "_handleDamageEH") then {
        _vehicle removeEventHandler ["HandleDamage", _handleDamageEH];
    };

    TRACE_1("vehicle no longer alive",_vehicle);

    false
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

    _addedDamage = abs _addedDamage;
};

if (isNil "_type") exitWith {
    TRACE_1("no relevant hitpoints hit, exiting",_hitPoint);

    true
};

// Ignore multiple hits at the same time
private _ignoreHit = false;
private _ignoreBailCheck = false;
private _multHit = _vehicle getVariable [QGVAR(hitTime), createHashMap];

private _key = format ["%1:%2", _projectile, _source];

if !(_key in _multHit) then {
    _multHit set [_key, [CBA_missionTime, [_hitPoint]]];
} else {
    private _stateArray = _multHit get _key;
    _stateArray params ["_lastHitTime", "_hitArray"];
    private _hitPointInOldArray = _hitPoint in _hitArray;
    private _withinTime = CBA_missionTime <= _lastHitTime + CONST_TIME;

    if (_hitPointInOldArray && _withinTime) then {
        _ignoreHit = true;
    } else {
        // If the hitpoint isnt in the old array then that means that the time expired and a new array should be generated
        if (_hitPointInOldArray) then {
            _multHit set [_key, [CBA_missionTime, [_hitPoint]]];
        } else {
            _hitArray pushBack _hitPoint;
            _multHit set [_key, [CBA_missionTime, _hitArray]];
            _ignoreBailCheck = true;
        };
    };
};
_vehicle setVariable [QGVAR(hitTime), _multHit];

if (_ignoreHit && !_structural) exitWith {
    TRACE_3("ignoring multiple hits done to vehicle",_vehicle,_source,_hitPoint);

    true
};

TRACE_3("processing hit done to vehicle",_vehicle,_source,CBA_missionTime);

if !([_vehicle, _hitPoint, _hitIndex, _addedDamage, _projectile, _source, _instigator] call FUNC(processHit)) exitWith {false};

if (!_ignoreBailCheck) then {
    _vehicle call FUNC(handleBail);
};

true
