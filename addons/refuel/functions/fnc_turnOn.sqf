#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Turns on a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_turnOn
 *
 * Public: No
 */

params ["_unit", "_nozzle"];

_nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime, 2];
_nozzle setVariable [QGVAR(isRefueling), true, true];
_nozzle setVariable [QGVAR(user), _unit, true];

[LSTRING(hint_Started), nil, _unit] call EFUNC(common,displayTextStructured);

// API
[QGVAR(started), [_nozzle getVariable [QGVAR(source), objNull], _nozzle getVariable [QGVAR(sink), objNull], _nozzle, _unit]] call CBA_fnc_localEvent;

// Only play start/stop sounds for nozzles
if (_nozzle getVariable [QGVAR(jerryCan), false]) exitWith {};

[_nozzle, QGVAR(nozzle_start), nil, true, false, true] call CBA_fnc_globalSay3D;
