/*
 * Author: GitHawk
 * Check if a unit can take a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Station or Nozzle <OBJECT>
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

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _target} ||
    {!isNull (_unit getVariable [QGVAR(nozzle), objNull])} ||
    {typeOf _target == QGVAR(fuelNozzle) && {!isNull (attachedTo _target)}} || // Not carried by someone else
    {([_unit, _target] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_target getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
