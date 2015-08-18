/*
 * Author: GitHawk
 * Check if a unit can cut a tilt rope.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Disconnect <BOOL>
 *
 * Example:
 * [tank, player] call ace_logistics_fnc_canCutTiltRope
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > TOWING_DISTANCE}) exitWith {false};

if !((_target getVariable [QGVAR(tiltUp), _unit]) == _unit) exitWith {false};

_unit getVariable [QGVAR(isTilting), 0] == 2
