#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Cleans up refuel on client disconnect.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_refuel_fnc_handleDisconnect
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("disconnect",_unit);

if (isNull _unit) exitWith {};

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if (isNull _nozzle) exitWith {};

[_unit, _nozzle] call FUNC(dropNozzle);
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
