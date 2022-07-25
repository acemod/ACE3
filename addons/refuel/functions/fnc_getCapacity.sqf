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
    if (isNumber(configOf _source >> QGVAR(fuelCargo))) then {
        _capacity = getNumber(configOf _source >> QGVAR(fuelCargo));
        if !(_capacity in [REFUEL_INFINITE_FUEL, REFUEL_DISABLED_FUEL]) then {
            _source setVariable [QGVAR(currentFuelCargo), _capacity, true];
        };
    } else {
        // Not a fuel source
        _capacity = REFUEL_DISABLED_FUEL;
    };
    _source setVariable [QGVAR(capacity), _capacity, true];
};

_capacity;