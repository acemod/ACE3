#include "script_component.hpp"
/*
 * Author: GitHawk
 * Turn off a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [nozzle] call ace_refuel_fnc_turnOff
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]]];

_nozzle setVariable [QGVAR(lastTickMissionTime), nil];
_nozzle setVariable [QGVAR(isRefueling), false, true];
[LSTRING(Hint_Stopped), 1.5, _unit] call EFUNC(common,displayTextStructured);
[QGVAR(stopped), [_nozzle getVariable QGVAR(source), _nozzle getVariable QGVAR(sink)]] call CBA_fnc_localEvent;
