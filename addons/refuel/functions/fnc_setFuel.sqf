#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Set the remaining fuel amount.
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 * 1: Amount (in liters) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fuelTruck, 42] call ace_refuel_fnc_setFuel
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]], ["_fuel", nil, [0]]];

// Ensure valid fuel quantity
if (isNull _source || {isNil "_fuel"}) exitWith {};

// Make sure this is actually a finite fuel source
private _capacity = [_source] call FUNC(getCapacity);
if (_capacity in [REFUEL_INFINITE_FUEL, REFUEL_DISABLED_FUEL]) exitWith {};

// Don't overfill or underfill tank
_source setVariable [QGVAR(currentFuelCargo), (_fuel min _capacity) max 0, true];
