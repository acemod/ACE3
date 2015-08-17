/*
 * Author: Glowbal
 * Load object into vehicle
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_loaded", "_space", "_itemSize"];
params ["_item", "_vehicle"];

if !([_item, _vehicle] call FUNC(canLoadItemIn)) exitwith {false};

_loaded = _vehicle getvariable [QGVAR(loaded), []];
_loaded pushback _item;
_vehicle setvariable [QGVAR(loaded), _loaded, true];

_space = [_vehicle] call FUNC(getCargoSpaceLeft);
_itemSize = [_item] call FUNC(getSizeItem);
_vehicle setvariable [QGVAR(space), _space - _itemSize, true];

detach _item;
_item attachTo [_vehicle,[0,0,100]];
["cargo_hideItem", [_item, true]] call EFUNC(common,serverEvent);

true;
