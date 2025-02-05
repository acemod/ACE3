#include "..\script_component.hpp"
/*
 * Author: QuantX
 * Gets the capacity of a fuel source's tank.
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

if (isNull _source) exitWith {REFUEL_DISABLED_FUEL};

private _capacity = _source getVariable QGVAR(capacity);

// Initialize fuel truck if needed
if (isNil "_capacity") then {
    // Check if this object has a fuelCargo config entry
    private _fuelCargo = configOf _source >> QGVAR(fuelCargo);
    _capacity = if (isNumber _fuelCargo) then {getNumber _fuelCargo} else {REFUEL_DISABLED_FUEL};

    // Set capacity even if this isn't a fuel source to save on config lookup time in the event this function is used in a loop
    _source setVariable [QGVAR(capacity), _capacity, true];
    // handle weird edge case when trying to run on "camera"/CfgNonAIVehicles which won't support setVariable and will inf-loop
    if (isNil {_source getVariable QGVAR(capacity)}) exitWith { WARNING_1("trying to getCapacity from non-CfgVehicle %1",_this); };
    [_source, _capacity] call FUNC(setFuel);
};

_capacity;
