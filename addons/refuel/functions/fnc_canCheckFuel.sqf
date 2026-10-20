#include "..\script_component.hpp"
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
 * [player, cursorObject] call ace_refuel_fnc_canCheckFuel
 *
 * Public: No
 */

params ["_unit", "_source"];

alive _unit &&
{_unit isKindOf "CAManBase"} &&
{alive _source} &&
{!((_source call FUNC(getCapacity)) in [REFUEL_INFINITE_FUEL, REFUEL_DISABLED_FUEL])} // return
