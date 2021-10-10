#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets effective interaction distance (handles very large vehicles)
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 0: Target Vehicle <OBJECT>
 *
 * Return Value:
 * Distance to interaction point <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_interaction_fnc_getInteractionDistance
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_3("getInteractionDistance",_unit,_target,typeOf _target);

// Handle Man, Crate
if (!((_target isKindOf "Car") || {_target isKindOf "Tank"} || {_target isKindOf "Helicopter"} || {_target isKindOf "Plane"} || {_target isKindOf "Ship_F"})) exitWith {
    _unit distance _target
};

private _unitEyeASL = eyePos _unit;
private _targetModelPos = [_target, _unitEyeASL] call FUNC(getVehiclePosComplex);
private _distance = _unitEyeASL distance (_target modelToWorldWorld _targetModelPos);

TRACE_2("",_targetModelPos,_distance);

_distance
