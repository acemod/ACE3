#include "script_component.hpp"
/*
 * Author: Jonpas, GitHawk
 * Checks if unit can check fuel.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * Can Check Fuel <BOOL>
 *
 * Example:
 * [player, truck] call ace_refuel_fnc_canCheckFuel
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

!(isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _source} ||
    {([_unit, _source] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE} ||
    {(_source call FUNC(getFuel) == REFUEL_INFINITE_FUEL)})
