#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Turn on a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 * 2: Refuel container <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_turnOn
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_refuelContainer", false, [false]]];

_nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime];
_nozzle setVariable [QGVAR(refuelContainer), _refuelContainer];
_nozzle setVariable [QGVAR(isRefueling), true, true];
[LSTRING(Hint_Started), 1.5, _unit] call EFUNC(common,displayTextStructured);
[QGVAR(started), [_nozzle getVariable QGVAR(source), _nozzle getVariable QGVAR(sink), _nozzle, _unit]] call CBA_fnc_localEvent;
