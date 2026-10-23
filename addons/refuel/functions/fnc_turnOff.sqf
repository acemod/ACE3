#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Turns off a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_turnOff
 *
 * Public: No
 */

params ["_unit", "_nozzle"];

_nozzle setVariable [QGVAR(lastTickMissionTime), nil, 2];
_nozzle setVariable [QGVAR(isRefueling), nil, true];

[LSTRING(hint_Stopped), 1.5, _unit] call EFUNC(common,displayTextStructured);

// API
[QGVAR(stopped), [_nozzle getVariable [QGVAR(source), objNull], _nozzle getVariable [QGVAR(sink), objNull], _nozzle]] call CBA_fnc_localEvent;

// Only play start/stop sounds for nozzles
if (_nozzle getVariable [QGVAR(jerryCan), false]) exitWith {};

[_nozzle, QGVAR(nozzle_stop), nil, true, true, true] call CBA_fnc_globalSay3D;
