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

scopeName "return";

private _isVirtual = (_item isEqualType "");
private _itemClass = if (_isVirtual) then {_item} else {typeOf _item};
private _config = (configFile >> "CfgVehicles" >> _itemClass >> QGVAR(size));

if (_isVirtual) then {
    if (isNumber _config) then {
        (getNumber _config) breakOut "return";
    };
} else {
    if (!isNil {_item getVariable QGVAR(size)}) then {
        (_item getVariable QGVAR(size)) breakOut "return";
    };
    if (isNumber _config) then {
        (getNumber _config) breakOut "return";
    };
};

-1
