#include "script_component.hpp"
/*
 * Author: 654wak654
 * Removes a cargo item from the vehicle.
 *
 * Arguments:
 * 0: Item <STRING> or <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * Number of items removed <NUMBER>
 *
 * Example:
 * ["ACE_Wheel", vehicle, 2] call ace_cargo_fnc_removeCargoItem
 * [crate_7, truck] call ace_cargo_fnc_removeCargoItem
 *
 * Public: Yes
 */

params ["_item", "_vehicle", ["_amount", 1]];
TRACE_3("params",_item,_vehicle,_amount);

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

private _addedSpace = 0;
private _itemClass = _item;
private _itemsRemoved = 0;

private _continue = if (_item isEqualType objNull) then {
    if !(_item in _loaded) exitWith {false};
    _addedSpace = [_item] call FUNC(getSizeItem);
    _loaded deleteAt (_loaded find _item);
    _itemClass = typeOf _item;
    deleteVehicle _item;
    _itemsRemoved = 1;
    true
} else {
    {
        if (_itemsRemoved == _amount) exitWith {};

        if (
            (_x isEqualType "" && {_x == _item}) || // Check for classname, case-insensitive
            {_x isEqualType objNull && {typeOf _x isEqualTo _item}}
        ) then {
            INC(_itemsRemoved);
            ADD(_addedSpace,[_x] call FUNC(getSizeItem));

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

private _space = [_vehicle] call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _space + _addedSpace, true];

// Invoke listenable event
["ace_cargoRemoved", [_itemClass, _vehicle, _amount, _itemsRemoved]] call CBA_fnc_globalEvent;

_itemsRemoved
