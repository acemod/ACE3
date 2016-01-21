/*
 * Author: BaerMitUmlaut and esteldunedain
 * Creates a tag on a wall that is on the closest surface within 2m on front of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The colour of the tag (valid colours are black, red, green and blue) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "blue"] call ace_tagging_fnc_tagWall
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_color"];

private _startPosASL = eyePos _unit;
private _cameraPosASL =  AGLToASL positionCameraToWorld [0, 0, 0];
private _cameraDir = (AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff _cameraPosASL;
private _endPosASL = _startPosASL vectorAdd (_cameraDir vectorMultiply 2.5);

[_unit, _startPosASL, _endPosASL, _color] call FUNC(tagDirection);
