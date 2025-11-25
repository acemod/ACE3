#include "..\script_component.hpp"
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
private _typeOf = typeOf _object;
private _cost = [_side, _typeOf] call FUNC(getCost);
private _tokensUsed = [_side, -_cost] call FUNC(updateBudget);

private _posASL = getPosASL _object;
private _vectorUp = vectorUp _object;
private _vectorDir = vectorDir _object;

deleteVehicle _object;

// Create progress bar to place object
private _totalTime = _cost * GVAR(timeCostCoefficient) + GVAR(timeMin); // time = Ax + b

private _perframeCheck = {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_unit", "_side", "_typeOf", "_posASL", "_vectorDir", "_vectorUp", "_cost"];

    // Animation loop (required for longer constructions)
    if (_totalTime != 0 && {animationState _unit != "AinvPknlMstpSnonWnonDnon_medic4"}) then {
        // Perform animation
        [_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
    };

    // Return true always
    true
};

[
    _totalTime,
    [_unit, _side, _typeOf, _posASL, _vectorDir, _vectorUp, _cost, _tokensUsed],
    QGVAR(deployFinished),
    QGVAR(deployCanceled),
    LLSTRING(progressBarTitle),
    _perframeCheck
] call EFUNC(common,progressBar);
