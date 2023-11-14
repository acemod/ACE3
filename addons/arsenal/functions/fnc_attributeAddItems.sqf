#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001, johnb43
 * Populates 3DEN's ace arsenal attribute listbox with items of given category.
 *
 * Arguments:
 * 0: Attribute controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_arsenal_fnc_attributeAddItems
 *
 * Public: No
 */

params ["_controlsGroup"];

forceUnicode 0; // handle non-ANSI characters

private _category = lbCurSel (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY);
private _filter = ctrlText (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_SEARCHBAR);
private _configItems = uiNamespace getVariable QGVAR(configItems);
private _magazineMiscItems = uiNamespace getVariable QGVAR(magazineMiscItems);
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue params ["_attributeItems", "_attributeMode"];

TRACE_3("Populating list",_category,_filter,_attributeValue);
if (_filter != "") then {
    _filter = _filter call EFUNC(common,escapeRegex);
    _filter = ".*?" + (_filter splitString " " joinString ".*?") + ".*?/io";
} else {
    _filter = ".*?/io";
};


private _modeSymbol = [SYMBOL_ITEM_VIRTUAL, SYMBOL_ITEM_REMOVE] select _attributeMode;

// Clear listbox
private _listbox = _controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST;
lnbClear _listbox;

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

// Exit with current items (no specific category)
if (_category == IDX_CAT_ALL) exitWith {
    private _config = configNull;
    private _displayName = "";
    private _index = -1;

    {
        // Get appropriate config for each item (different since items can be from any category)
        _config = switch (true) do {
            case (_x in _magazineMiscItems);
            case (_x in (_configItems get IDX_VIRT_ITEMS_ALL));
            case (_x in (_configItems get IDX_VIRT_GRENADES));
            case (_x in (_configItems get IDX_VIRT_EXPLOSIVES)): {_cfgMagazines >> _x};
            case (_x in (_configItems get IDX_VIRT_BACKPACK)): {_cfgVehicles >> _x};
            case (_x in (_configItems get IDX_VIRT_GOGGLES)): {_cfgGlasses >> _x};
            default {_cfgWeapons >> _x};
        };

        _displayName = getText (_config >> "displayName");

        // Add item if not filtered
        if (_displayName regexMatch _filter || {_x regexMatch _filter}) then {
            _index = _listbox lnbAddRow ["", _displayName, _modeSymbol];
            _listbox lnbSetData [[_index, 1], _x];
            _listbox lnbSetPicture [[_index, 0], getText (_config >> "picture")];
            _listbox lnbSetTooltip [[_index, 0], _x];
        };
    } forEach _attributeItems;

    // Sort alphabetically
    _listbox lnbSort [1, false];
};

// Get list of category items
private _categoryItems = switch (true) do {
    // Weapons
    case (_category < IDX_CAT_OPTICS_ATTACHMENTS): {
        (_configItems get IDX_VIRT_WEAPONS) get (_category - 1)
    };
    // Weapon attachments
    case (_category < IDX_CAT_ITEMS_ALL): {
        (_configItems get IDX_VIRT_ATTACHMENTS) get (_category - 4)
    };
    // Other
    default {
        _configItems get (_category - 6)
    };
};

// Get config for current category
private _cfgClass = switch (true) do {
    case (_category in [IDX_CAT_ITEMS_ALL, IDX_CAT_GRENADES, IDX_CAT_EXPLOSIVES]): {_cfgMagazines};
    case (_category == IDX_CAT_BACKPACK): {_cfgVehicles};
    case (_category == IDX_CAT_GOGGLES): {_cfgGlasses};
    default {_cfgWeapons};
};

private _displayName = "";
private _symbol = SYMBOL_ITEM_NONE;
private _alpha = 0;
private _index = -1;
private _config = _cfgClass;

// Populate listbox with category items
{
    // "Misc. items" magazines (e.g. spare barrels, intel, photos)
    if (_category == IDX_CAT_MISC_ITEMS) then {
        _config = [_cfgClass, _cfgMagazines] select (_x in _magazineMiscItems);
    };

    _displayName = getText (_config >> _x >> "displayName");

    // Add item if not filtered
    if (_displayName regexMatch _filter || {_x regexMatch _filter}) then {
        // Change symbol and alpha if item already selected
        if (_x in _attributeItems) then {
            _symbol = _modeSymbol;
            _alpha = 1;
        } else {
            _symbol = SYMBOL_ITEM_NONE;
            _alpha = 0.5;
        };

        _index = _listbox lnbAddRow ["", _displayName, _symbol];
        _listbox lnbSetData [[_index, 1], _x];
        _listbox lnbSetPicture [[_index, 0], getText (_config >> _x >> "picture")];
        _listbox lnbSetTooltip [[_index, 0], _x];
        _listbox lnbSetColor [[_index, 1], [1, 1, 1, _alpha]];
        _listbox lnbSetColor [[_index, 2], [1, 1, 1, _alpha]];
    };
} forEach (keys _categoryItems);

// Sort alphabetically
_listbox lnbSort [1, false];

// Reset unicode flag
forceUnicode -1;
