/*
 * Author: Glowbal
 * Get the cargo size of an object.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 *
 * Return value:
 * Cargo size <NUMBER> (default: -1)
 *
 * Example:
 * [object] call ace_cargo_fnc_getSizeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item"];
private ["_isVirtual","_itemClass","_config"];
scopeName "return";

_isVirtual = (_item isEqualType "");
_itemClass = if (_isVirtual) then {_item} else {typeOf _item};
_config = (configFile >> "CfgVehicles" >> _itemClass >> QGVAR(size));

if (_isVirtual) then {
    if (isNumber _config) then {
        (getNumber _config) breakOut "return";
    };
} else {
    _config = (configFile >> "CfgVehicles" >> typeOf _item >> QGVAR(size));

    if (isNumber _config) then {
        (_item getVariable [QGVAR(size), getNumber _config]) breakOut "return";
    };
};

-1
