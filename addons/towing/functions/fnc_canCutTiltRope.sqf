/*
 * Author: GitHawk
 * Check if a unit can cut a tilt rope
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Disconnect <BOOL>
 *
 * Example:
 * [tank] call ace_logistics_fnc_canCutTiltRope
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit","_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {false};

if !((_target getVariable [QGVAR(tiltUp), _unit]) == _unit) exitWith {false};

if ((_unit getVariable [QGVAR(isTilting), 0]) == 2) exitWith {true};

false
