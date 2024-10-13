#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns item replacements for a given type and/or item.
 *
 * Arguments:
 * 0: Item or item type ID to check <STRING or NUMBER>
 * 1: Include type replacements for items <BOOL> (default: true)
 *
 * Return Value:
 * Item replacements <ARRAY of STRING>
 *
 * Example:
 * ["FirstAidKit", false] call ace_common_fnc_getItemReplacements
 *
 * Public: Yes
 */

params [["_item", "", [0,""]], ["_includeType", true, [true]]];

// If no item replacements exist or item is empty then we don't have any
if (isNil QGVAR(itemReplacements) || _item isEqualTo "") exitWith {[]};

if (_item isEqualType 0) exitWith {
    GVAR(itemReplacements) getOrDefault ["$" + str _item, []]
};

_item = _item call FUNC(getConfigName);
private _replacements = GVAR(itemReplacements) getOrDefault [_item, []];

if (_includeType) then {
    // If replaceRegisteredItems ever supports replacing magazines this'll need to be more robust
    private _itemType = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type");
    _replacements append (GVAR(itemReplacements) getOrDefault ["$" + str _itemType]);
};

_replacements // return
