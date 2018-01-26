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
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]]];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _object} ||
    {!isNull (_unit getVariable [QGVAR(nozzle), objNull])} ||
    {typeOf _object == QGVAR(fuelNozzle) && {!isNull (attachedTo _object)}} || // Not carried by someone else
    {([_unit, _object] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_object getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
