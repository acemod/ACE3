#include "..\script_component.hpp"
/*
 * Author: 654wak654
 * Removes a cargo item from the vehicle.
 *
 * Arguments:
 * 0: Item to be removed <STRING or OBJECT> (default: "")
 * 1: Holder object (vehicle) <OBJECT> (default: objNull)
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * Number of items removed <NUMBER>
 *
 * Example:
 * ["ACE_Wheel", cursorObject, 2] call ace_cargo_fnc_removeCargoItem
 * [crate_7, truck] call ace_cargo_fnc_removeCargoItem
 *
 * Public: Yes
 */

params [["_item", "", [objNull, ""]], ["_vehicle", objNull, [objNull]], ["_amount", 1, [0]]];
TRACE_3("params",_item,_vehicle,_amount);

// Get config sensitive case name
if (_item isEqualType "") then {
    _item = _item call EFUNC(common,getConfigName);
};

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

private _addedSpace = 0;
private _itemClass = _item;
private _itemsRemoved = 0;

private _continue = if (_item isEqualType objNull) then {
    if !(_item in _loaded) exitWith {false};

    _addedSpace = (_item call FUNC(getSizeItem)) max 0; // don't let negative size items increase space
    _loaded deleteAt (_loaded find _item);

    _itemClass = typeOf _item;

    // Delete item
    deleteVehicle _item;

    _itemsRemoved = 1;

    true
} else {
    {
        if (_itemsRemoved == _amount) exitWith {};

        if (
            (_x isEqualType "" && {_x == _item}) ||
            {_x isEqualType objNull && {typeOf _x == _item}}
        ) then {
            INC(_itemsRemoved);
            _addedSpace = _addedSpace + ((_x call FUNC(getSizeItem)) max 0); // don't let negative size items increase space

            // Delete item
            if (_x isEqualType objNull) then {
                deleteVehicle _x;
            };

            _loaded set [_forEachIndex, nil];
        };
    } forEach _loaded;

    FILTER(_loaded,!isNil "_x");

    true
};

if (!_continue) exitWith {0};

_vehicle setVariable [QGVAR(loaded), _loaded, true];

// Update remaining cargo space
private _cargoSpace = _vehicle call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _cargoSpace + _addedSpace, true];

// Invoke listenable event
["ace_cargoRemoved", [_itemClass, _vehicle, _amount, _itemsRemoved]] call CBA_fnc_globalEvent;

_itemsRemoved
