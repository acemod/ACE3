#include "script_component.hpp"
/*
 * Author: QuantX
 * Get the capacity of a fuel source's tank
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 *
 * Return Value:
 * Fuel capacity <NUMBER> (-10 means infinte fuel, -1 means not a fuel source, >0 is a capacity in liters)
 *
 * Example:
 * [fuelTruck] call ace_refuel_fnc_getCapacity
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]]];

if (isNull _source) exitWith {0};

private _capacity = _source getVariable QGVAR(capacity);

// Initialize fuel truck if needed
if (isNil "_capacity") then {
    // Check if this object has a fuelCargo config entry
    _capacity = if (isNumber(configOf _source >> QGVAR(fuelCargo))) then {
        getNumber(configOf _source >> QGVAR(fuelCargo))
    } else {
        REFUEL_DISABLED_FUEL // Not a fuel source
    };
    _source setVariable [QGVAR(capacity), _capacity, true];
    [_source, _capacity] call FUNC(setFuel);
};

_capacity;