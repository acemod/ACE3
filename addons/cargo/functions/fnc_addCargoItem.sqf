#include "..\script_component.hpp"
/*
 * Author: Glowbal, Jonpas
 * Adds a cargo item to the vehicle.
 *
 * Arguments:
 * 0: Item to be loaded <STRING or OBJECT>
 * 1: Holder object (vehicle) <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 * 3: Ignore interaction distance and stability checks <BOOL> (default: false)
 *
 * Return Value:
 * Objects loaded <NUMBER>
 *
 * Example:
 * ["ACE_Wheel", cursorObject] call ace_cargo_fnc_addCargoItem
 *
 * Public: No
 */

params ["_item", "_vehicle", ["_amount", 1], ["_ignoreInteraction", false]];
TRACE_4("params",_item,_vehicle,_amount,_ignoreInteraction);

private _loaded = 0;

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);

    for "_i" from 1 to _amount do {
        if !([_item, _vehicle, _ignoreInteraction] call FUNC(loadItem)) exitWith {};

        _loaded = _loaded + 1;
    };
} else {
    _loaded = parseNumber ([_item, _vehicle, _ignoreInteraction] call FUNC(loadItem));

    _item = typeOf _item;
};

TRACE_1("loaded",_loaded);

// Invoke listenable event
if (_loaded > 0) then {
    ["ace_cargoAdded", [_item, _vehicle, _loaded]] call CBA_fnc_globalEvent;
};

_loaded // return
