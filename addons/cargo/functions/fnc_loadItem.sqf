/*
 * Author: Glowbal
 * Load object into vehicle.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return value:
 * Object loaded <BOOL>
 *
 * Example:
 * [object, vehicle] call ace_cargo_fnc_loadItem
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_loaded", "_space", "_itemSize"];

params ["_item", "_vehicle"];
TRACE_2("params",_item,_vehicle);

if !([_item, _vehicle] call FUNC(canLoadItemIn)) exitWith {
    TRACE_2("canLoadItemIn failed",_item,_vehicle);
    false
};

_loaded = _vehicle getVariable [QGVAR(loaded), []];
_loaded pushback _item;
_vehicle setVariable [QGVAR(loaded), _loaded, true];

TRACE_1("added to loaded array",_loaded);

_space = [_vehicle] call FUNC(getCargoSpaceLeft);
_itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), _space - _itemSize, true];

detach _item;
_item attachTo [_vehicle,[0,0,100]];
["hideObjectGlobal", [_item, true]] call EFUNC(common,serverEvent);

// show hint
private ["_itemName", "_vehicleName"];

_itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

["displayTextStructured", [[localize LSTRING(LoadedItem), _itemName, _vehicleName], 3.0]] call EFUNC(common,localEvent);

// Invoke listenable event
["cargoLoaded", [_item, _vehicle]] call EFUNC(common,globalEvent);

true
