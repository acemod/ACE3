#include "script_component.hpp"
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

private _category = lbCurSel (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_CATEGORY) - 1;
private _filter = toLower ctrlText (_controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_SEARCHBAR);
private _configItems = uiNamespace getVariable [QGVAR(configItems), []];
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
_attributeValue params ["_attributeItems", "_attributeMode"];

TRACE_3("Populating list",_category,_filter,_attributeValue);

private _modeSymbol = [SYMBOL_ITEM_VIRTUAL, SYMBOL_ITEM_REMOVE] select _attributeMode;

// Clear listbox
private _listbox = _controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST;
lnbClear _listbox;

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

// Exit with current items (no specific category)
if (_category == -1) exitWith {
    private _config = configNull;
    private _displayName = "";
    private _picture = "";
    private _index = -1;

    {
        // Get appropriate config for each item (different since items can be from any category)
        _config = switch (true) do {
            case (_x in (_configItems select IDX_VIRT_ITEMS_ALL));
            case (_x in (_configItems select IDX_VIRT_GRENADES));
            case (_x in (_configItems select IDX_VIRT_EXPLOSIVES)): {_cfgMagazines >> _x};
            case (_x in (_configItems select IDX_VIRT_BACKPACK)): {_cfgVehicles >> _x};
            case (_x in (_configItems select IDX_VIRT_GOGGLES)): {_cfgGlasses >> _x};
            default {_cfgWeapons >> _x};
        };

        _displayName = getText (_config >> "displayName");

        // Add item if not filtered
        if (_filter in (toLower _displayName) || {_filter in (toLower _x)}) then {
            _picture = getText (_config >> "picture");
            _index = _listbox lnbAddRow ["", _displayName, _modeSymbol];
            _listbox lnbSetData [[_index, 1], _x];
            _listbox lnbSetPicture [[_index, 0], _picture];
            _listbox lbSetTooltip [_index * (count lnbGetColumnsPosition _listbox), _x];
        };
    } forEach _attributeItems;

    _listbox lnbSort [1];
};

// Get list of category items
private _categoryItems = switch (true) do {
    // Weapons
    case (_category < 3): {
        _configItems select IDX_VIRT_WEAPONS select _category;
    };
    // Weapon attachments
    case (_category < 7): {
        _configItems select IDX_VIRT_ATTACHMENTS select (_category - 3);
    };
    // Other
    default {
        _configItems select (_category - 5);
    };
};

// Get config for current category
private _config = switch (true) do {
    case (_category in [7, 20, 21]): {_cfgMagazines};
    case (_category == 11): {_cfgVehicles};
    case (_category == 12): {_cfgGlasses};
    default {_cfgWeapons};
};

private _displayName = "";
private _picture = "";
private _symbol = SYMBOL_ITEM_NONE;
private _alpha = 0;
private _index = -1;

// Populate listbox with category items
{
    _displayName = getText (_config >> _x >> "displayName");

    // Add item if not filtered
    if (_filter in (toLower _displayName) || {_filter in (toLower _x)}) then {
        _picture = getText (_config >> _x >> "picture");
        _symbol = SYMBOL_ITEM_NONE;
        _alpha = 0.5;

        // Change symbol and alpha if item already selected
        if (_x in _attributeItems) then {
            _symbol = _modeSymbol;
            _alpha = 1;
        };

        _index = _listbox lnbAddRow ["", _displayName, _symbol];
        _listbox lnbSetData [[_index, 1], _x];
        _listbox lnbSetPicture [[_index, 0], _picture];
        _listbox lbSetTooltip [_index * (count lnbGetColumnsPosition _listbox), _x];
        _listbox lnbSetColor [[_index, 1], [1, 1, 1, _alpha]];
        _listbox lnbSetColor [[_index, 2], [1, 1, 1, _alpha]];
    };
} forEach _categoryItems;

_listbox lnbSort [1];
