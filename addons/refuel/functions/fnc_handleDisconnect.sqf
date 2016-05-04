/*
 * Author: GitHawk
 * Cleans up refuel
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
#include "script_component.hpp"

params [["_disconnectedPlayer", objNull, [objNull]]];

if (isNull _disconnectedPlayer) exitWith {};

private _nozzle = _disconnectedPlayer getVariable [QGVAR(nozzle), objNull];

if (isNull _nozzle) exitWith {};

[_disconnectedPlayer, _nozzle] call FUNC(dropNozzle);
