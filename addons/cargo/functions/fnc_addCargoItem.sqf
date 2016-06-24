/*
 * Author: Glowbal, Jonpas
 * Adds a cargo item to the vehicle.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 * 3: Show Hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["item", vehicle] call ace_cargo_fnc_addCargoItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_itemClass", "_vehicle", ["_amount", 1], ["_showHint", false, [false]]];
TRACE_3("params",_itemClass,_vehicle,_amount);

for "_i" from 1 to _amount do {
    [_itemClass, _vehicle] call FUNC(loadItem);
};

// Invoke listenable event
["ace_cargoAdded", [_itemClass, _vehicle, _amount]] call CBA_fnc_globalEvent;
