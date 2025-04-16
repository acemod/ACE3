#include "..\script_component.hpp"
/*
 * Author: JasperRab
 * Gets the name of the item, and alternatively the custom name if requested and available.
 *
 * Arguments:
 * 0: Item <STRING or OBJECT> (default: "")
 * 1: Add custom name <BOOL> (default: false)
 *
 * Return Value:
 * Item name <STRING>
 *
 * Example:
 * cursorObject call ace_cargo_fnc_getNameItem
 *
 * Public: Yes
 */

params [["_item", "", [objNull, ""]], ["_addCustomName", false, [false]]];

private _displayName = if (_item isEqualType "") then {
    getText (configFile >> "CfgVehicles" >> _item >> "displayName")
} else {
    getText (configOf _item >> "displayName")
};

if (_addCustomName && {_item isEqualType objNull}) then {
    private _customName = _item getVariable [QGVAR(customName), ""];

    if (_customName isNotEqualTo "") then {
        _displayName = _displayName + " [" + _customName + "]";
    };
};

_displayName
