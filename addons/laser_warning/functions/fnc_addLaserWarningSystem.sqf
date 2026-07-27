#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initialises a laser warning system for the given object (Server only)
 *
 * Arguments:
 * 0: Object to add to <OBJECT>
 * 1: Radius of laser detector <NUMBER>
 * 2: Position offset of detector <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyCar] call ace_laser_warning_fnc_addLaserWarningSystem;
 *
 * Public: Yes
 */
params [
    ["_object", objNull, [objNull]],
    ["_radius", 0, [0]],
    ["_offset", [0, 0, 0], [[0, 0, 0]], 3]
];

if (isNull _object) exitWith {};
if (_radius <= 0) exitWith {};

_object setVariable [QGVAR(detectionParameters), [_offset, _radius], true];
_object setVariable [QGVAR(state_box), true call FUNC(default_boxState), true];
_object setVariable [QGVAR(state_audio), true call FUNC(default_soundState), true];
_object setVariable [QGVAR(state_hunterKiller), true call FUNC(default_hunterKillerState), true];
_object setVariable [QGVAR(enabled), true, true];

GVAR(objects) pushBack _object;