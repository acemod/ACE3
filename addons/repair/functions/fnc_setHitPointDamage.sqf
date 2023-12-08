#include "..\script_component.hpp"
/*
 * Author: commy2
 * Set the hitpoint damage and change the structural damage acordingly, requires local vehicle.
 * Handles the ace_repair_setVehicleHitPointDamage event.
 *
 * Arguments:
 * 0: Local Vehicle to Damage <OBJECT>
 * 1: Selected hitpoint INDEX <NUMBER>
 * 2: Total Damage <NUMBER>
 * 3: Use destruction effects <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 1, 0.5] call ace_repair_fnc_setHitPointDamage
 *
 * Public: No
 */

params ["_vehicle", "_hitPointIndex", "_hitPointDamage", ["_useEffects", false]];
TRACE_4("params",_vehicle,typeOf _vehicle,_hitPointIndex,_hitPointDamage);

// can't execute all commands if the vehicle isn't local. exit here.
if !(local _vehicle) exitWith {ERROR_1("Vehicle Not Local %1", _vehicle);};

// get all hitpoints and selections and damages
(getAllHitPointsDamage _vehicle) params ["", "_hitSelections", "_damageValues"];

([_vehicle] call FUNC(getSelectionsToIgnore)) params ["_indexesToIgnore", "_dependsIndexMap"];

// exit if the hitpoint is not valid
if ((_hitPointIndex < 0) || {_hitPointIndex >= (count _hitSelections)}) exitWith {ERROR_2("NOT A VALID HITPOINT: %1-%2",_hitPointIndex,_vehicle);};

// save structural damage and sum of hitpoint damages
private _damageOld = damage _vehicle;

private _realHitPointCount = 0;
private _hitPointDamageSumOld = 0;
private _hitPointDamageRepaired = 0; //positive for repairs : newSum = (oldSum - repaired)
{
    if (!(_forEachIndex in _indexesToIgnore) && !(_forEachIndex in _dependsIndexMap)) then {
        _realHitPointCount = _realHitPointCount + 1;
        _hitPointDamageSumOld = _hitPointDamageSumOld + (_damageValues select _forEachIndex);
        if (_forEachIndex == _hitPointIndex) then {
            _hitPointDamageRepaired = (_damageValues select _forEachIndex) - _hitPointDamage;
        };
    };
} forEach _hitSelections;

// calculate new structural damage
private _damageNew = (_hitPointDamageSumOld - _hitPointDamageRepaired) / _realHitPointCount;

if (_hitPointDamageSumOld > 0) then {
    _damageNew = _damageOld * ((_hitPointDamageSumOld - _hitPointDamageRepaired) / _hitPointDamageSumOld);
};
TRACE_5("structuralDamage",_damageOld,_damageNew,_hitPointDamageRepaired,_hitPointDamageSumOld,_realHitPointCount);

// set new structural damage value
private _damageDisabled = !isDamageAllowed _vehicle;
if (_damageDisabled) then {
    _vehicle allowDamage true;
};

_vehicle setDamage [_damageNew, _useEffects];

//Repair the hitpoint in the damages array:
_damageValues set [_hitPointIndex, _hitPointDamage];

//Set the new damage for all hitpoints
{
    _vehicle setHitIndex [_forEachIndex, _x, _useEffects];
} forEach _damageValues;

// normalize hitpoints
[_vehicle] call FUNC(normalizeHitPoints);

if (_damageDisabled) then {
    _vehicle allowDamage false;
};
