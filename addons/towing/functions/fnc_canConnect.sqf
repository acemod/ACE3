/*
 * Author: GitHawk
 * Check if a unit can connect a tilt rope
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Connect <BOOL>
 *
 * Example:
 * [tank, player] call ace_towing_fnc_canConnect
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit","_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > TOWING_DISTANCE}) exitWith {false};

_tiltUp = _target getVariable [QGVAR(tiltUp), nil];
if !(isNil "_tiltUp") exitWith {false};

if (((vectorUp _target) select 2) < 0.7 || {(_unit getVariable [QGVAR(isTilting), 0]) == 1}) exitWith {true};

false
