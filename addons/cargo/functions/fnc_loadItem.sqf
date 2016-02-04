/*
 * Author: Glowbal
 * Load object into vehicle.
 * Objects loaded via classname remain virtual until unloaded.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 * 1: Vehicle <OBJECT>
 * 2: Show Hint <BOOL> (default: true)
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

params [["_item","",[objNull,""]], ["_vehicle",objNull,[objNull]]];

if !([_item, _vehicle] call FUNC(canLoadItemIn)) exitWith {false};

private _loaded = _vehicle getVariable [QGVAR(loaded), []];
_loaded pushBack _item;
_vehicle setVariable [QGVAR(loaded), _loaded, true];

TRACE_1("added to loaded array",_loaded);

private _space = [_vehicle] call FUNC(getCargoSpaceLeft);
private _itemSize = [_item] call FUNC(getSizeItem);
_vehicle setVariable [QGVAR(space), _space - _itemSize, true];

if (_item isEqualType objNull) then {
    detach _item;
    _item setPos [-100000,-100000,-100000];
    _item allowDamage false;
    ["hideObjectGlobal", [_item, true]] call EFUNC(common,serverEvent);
};

true
