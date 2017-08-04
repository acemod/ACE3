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

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]]];

if (isNull _unit  ||
    {isNull _nozzle} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit}) exitWith {};

private _attachedNozzle = _unit getVariable [QGVAR(nozzle), nil];
if (isNil "_attachedNozzle") exitWith {};

if (_nozzle != _attachedNozzle) exitWith {};

call EFUNC(interaction,hideMouseHint);
