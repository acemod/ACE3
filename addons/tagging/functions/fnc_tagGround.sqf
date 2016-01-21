/*
 * Author: BaerMitUmlaut and esteldunedain
 * Creates a tag on the ground beneath the unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The colour of the tag (valid colours are black, red, green and blue) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "blue"] call ace_tagging_fnc_tagGround
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_color"];

private _startPosASL = getPosASL _unit;
private _endPosASL = _startPosASL vectorAdd [0, 0, -2] vectorAdd eyeDirection _unit;

[_unit, _startPosASL, _endPosASL, _color] call FUNC(tagDirection);
