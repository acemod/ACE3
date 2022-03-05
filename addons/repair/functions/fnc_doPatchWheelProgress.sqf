#include "script_component.hpp"
/*
 * Author: commy2, Brett Mayson
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * 0: Unit that does the patching <OBJECT>
 * 1: Vehicle to patch <OBJECT>
 * 2: Selected wheel hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_doPatchWheelProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

// get current hitpoint damage
private _hitPointDamage = _vehicle getHitPointDamage _hitPoint;

private _iterationsRemaining = ceil ((_hitPointDamage - GVAR(patchWheelMaximumRepair)) / 0.05) - 1;
if ((_totalTime - _elapsedTime) > _iterationsRemaining * GVAR(patchWheelTime)) exitWith {true};

_hitPointDamage = _hitPointDamage - 0.05;

if (_hitPointDamage < GVAR(patchWheelMaximumRepair)) then {
    _hitPointDamage = GVAR(patchWheelMaximumRepair);
};

// raise event to set the new hitpoint damage
[QGVAR(setWheelHitPointDamage), [_vehicle, _hitPoint, _hitPointDamage], _vehicle] call CBA_fnc_targetEvent;

_hitPointDamage > GVAR(patchWheelMaximumRepair)
