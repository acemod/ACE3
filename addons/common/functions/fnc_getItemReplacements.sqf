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
 * Item replacements (strings if replacements exist, nil if not) <ARRAY of STRINGs or NIL>
 *
 * Example:
 * ["FirstAidKit", false] call ace_common_fnc_getItemReplacements
 *
 * Public: Yes
 */

params [["_item", "", [0, ""]], ["_includeType", true, [true]]];

// If no item replacements exist or item is empty then we don't have any
if (isNil QGVAR(itemReplacements) || _item isEqualTo "") exitWith {};

if (_item isEqualType 0) exitWith {
    GVAR(itemReplacements) get ("$" + str _item)
};

_item = _item call FUNC(getConfigName);
private _replacements = GVAR(itemReplacements) get _item;

if (_includeType) then {
    // If replaceRegisteredItems ever supports replacing magazines this'll need to be more robust
    private _itemType = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type");
    private _typeReplacements =  GVAR(itemReplacements) get ("$" + str _itemType);
    if (!isNil "_replacements") then {
        _replacements append _typeReplacements;
    } else {
        _replacements = _typeReplacements;
    };
};

_replacements // return
