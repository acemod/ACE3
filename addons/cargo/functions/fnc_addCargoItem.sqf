#include "..\script_component.hpp"
/*
 * Author: Glowbal, Jonpas
 * Adds a cargo item to the vehicle.
 *
 * Arguments:
 * 0: Item to be loaded <STRING> or <OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_addCargoItem
 *
 * Public: No
 */

params ["_item", "_vehicle", ["_amount", 1]];
TRACE_3("params",_item,_vehicle,_amount);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);

    for "_i" from 1 to _amount do {
        [_item, _vehicle] call FUNC(loadItem);
    };
} else {
    [_item, _vehicle] call FUNC(loadItem);

    _item = typeOf _item;
};

// Invoke listenable event
["ace_cargoAdded", [_item, _vehicle, _amount]] call CBA_fnc_globalEvent;
