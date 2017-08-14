/*
 * Author: 654wak654
 * Removes a cargo item from the vehicle.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Amount <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["item", vehicle] call ace_cargo_fnc_removeCargoItem
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_itemClass", "_vehicle", ["_amount", 1]];
TRACE_3("params",_itemClass,_vehicle,_amount);

private _loaded = _vehicle getVariable [QGVAR(loaded), []];

private _itemsToRemove = [];
private _addedSpace = 0;

{
    if (count _itemsToRemove == _amount) exitWith {};

    if (_x == _itemClass || {typeOf _x == _itemClass}) {
        _itemsToRemove pushBack _forEachIndex;
        ADD(_addedSpace,[_x] call FUNC(getSizeItem));

        if (_x isEqualType objNull) then {
            deleteVehicle _x;
        };
    };
} forEach _loaded;

{_loaded deleteAt _x} forEach _itemsToRemove;
_vehicle setVariable [QGVAR(loaded), _loaded, true];

private _space = [_vehicle] call FUNC(getCargoSpaceLeft);
_vehicle setVariable [QGVAR(space), _space + _addedSpace, true];

// Invoke listenable event
["ace_cargoRemoved", [_itemClass, _vehicle, _amount]] call CBA_fnc_globalEvent;
