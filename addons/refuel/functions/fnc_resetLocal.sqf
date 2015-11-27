/*
 * Author: GitHawk
 * Resets a player
 *
 * Arguments:
 * 0: Fuel nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [nozzle] call ace_refuel_fnc_resetLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_nozzle"];


if (isNull _unit  ||
    {isNull _nozzle} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit}) exitWith {};
private ["_attachedNozzle", "_actionID"];
_attachedNozzle = _unit getVariable [QGVAR(nozzle), nil];
if (isNil "_attachedNozzle") exitWith {};

if (_nozzle != _attachedNozzle) exitWith {};

_actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
if (_actionID != -1) then {
    _unit removeAction _actionID;
    _unit setVariable [QGVAR(isRefueling), false, true];
    _unit setVariable [QGVAR(ReleaseActionID), nil];
    _unit setVariable [QGVAR(nozzle), nil];
};
