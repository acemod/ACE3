#include "script_component.hpp"
/*
 * Author: Kingsley
 * Confirms the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Fortify Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, wall] call ace_fortify_fnc_deployConfirm
 *
 * Public: No
 */

params ["_unit", "_object"];
TRACE_2("deployConfirm",_unit,_object);

private _side = side group _unit;
private _cost = [_side, typeOf _object] call FUNC(getCost);
[_side, -_cost] call FUNC(updateBudget);

private _typeOf = typeOf _object;
private _posASL = getPosASL _object;
private _vectorUp = vectorUp _object;
private _vectorDir = vectorDir _object;

deleteVehicle _object;

// Create progress bar to place object
private _totalTime = _cost * GVAR(timeCostCoefficient) + GVAR(timeMin); // time = Ax + b

[
    _totalTime,
    [_unit, _side, _typeOf, _posASL, _vectorDir, _vectorUp],
    QGVAR(deployFinished),
    QGVAR(deployCanceled),
    LLSTRING(progressBarTitle)
] call EFUNC(common,progressBar);
