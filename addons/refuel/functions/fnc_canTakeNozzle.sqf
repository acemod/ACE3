#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Check if a unit can take a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source or Nozzle <OBJECT>
 *
 * Return Value:
 * Can connect <BOOL>
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canTakeNozzle
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]]];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _object} ||
    {!isNull (_unit getVariable [QGVAR(nozzle), objNull])} || // Not already carrying a nozzle
    {(_object getVariable [QGVAR(jerryCan), false]) && {!isNull (_object getVariable [QGVAR(nozzle), objNull])}} || // Prevent jerry cans from being picked up if they have a nozzle connected
    {!([_unit, _object, [INTERACT_EXCEPTIONS]] call EFUNC(common,canInteractWith))} || // Not carried by someone else
    {([_unit, _object] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_object getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
