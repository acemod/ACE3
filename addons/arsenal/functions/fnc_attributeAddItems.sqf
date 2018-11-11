#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: mharis001
 * Populates 3DEN attribute listbox with items of given category.
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
private _configItems = +(uiNamespace getVariable [QGVAR(configItems), []]);
private _attributeValue = uiNamespace getVariable [QGVAR(attributeValue), [[], 0]];
TRACE_3("Populating list",_category,_filter,_attributeValue);

_attributeValue params ["_attributeItems", "_attributeMode"];
private _modeSymbol = [SYMBOL_ITEM_VIRTUAL, SYMBOL_ITEM_REMOVE] select _attributeMode;

// Clear listbox
private _listbox = _controlsGroup controlsGroupCtrl IDC_ATTRIBUTE_LIST;
lnbClear _listbox;

// Exit with current items (no specific category)
if (_category == -1) exitWith {
    {
        // Get appropriate config for each item (different since items can be from any category)
        private _config = switch (true) do {
            case (_x in (_configItems select 2));
            case (_x in (_configItems select 15));
            case (_x in (_configItems select 16)): {
                configFile >> "CfgMagazines" >> _x;
            };
            case (_x in (_configItems select 6)): {
                configFile >> "CfgVehicles" >> _x;
            };
            case (_x in (_configItems select 7)): {
                configFile >> "CfgGlasses" >> _x;
            };
            default {
                configFile >> "CfgWeapons" >> _x;
            };
        };

        // Add item if not filtered
        private _displayName = getText (_config >> "displayName");
        if (toLower _displayName find _filter > -1) then {
            private _picture = getText (_config >> "picture");
            private _index = _listbox lnbAddRow ["", _displayName, _modeSymbol];
            _listbox lnbSetData [[_index, 1], _x];
            _listbox lnbSetPicture [[_index, 0], _picture];
            _listbox lbSetTooltip [_index * (count lnbGetColumnsPosition _listbox), _x];
        };
    } forEach _attributeItems;

    _listbox lnbSort [1];
};

// Get list of category items
private _categoryItems = switch (true) do {
    case (_category < 3): {
        _configItems select 0 select _category;
    };
    case (_category < 7): {
        _configItems select 1 select (_category - 3);
    };
    default {
        _configItems select (_category - 5);
    };
};

// Get config for current category
private _config = switch (true) do {
    case (_category in [7, 20, 21]): {
        configFile >> "CfgMagazines";
    };
    case (_category == 11): {
        configFile >> "CfgVehicles";
    };
    case (_category == 12): {
        configFile >> "CfgGlasses";
    };
    default {
        configFile >> "CfgWeapons";
    };
};

// Populate listbox with category items
{
    // Add item if not filtered
    private _displayName = getText (_config >> _x >> "displayName");
    if (toLower _displayName find _filter > -1) then {
        private _picture = getText (_config >> _x >> "picture");
        private _symbol = SYMBOL_ITEM_NONE;
        private _alpha = 0.5;

        // Change symbol and alpha if item already selected
        if (_x in _attributeItems) then {
            _symbol = _modeSymbol;
            _alpha = 1;
        };

        private _index = _listbox lnbAddRow ["", _displayName, _symbol];
        _listbox lnbSetData [[_index, 1], _x];
        _listbox lnbSetPicture [[_index, 0], _picture];
        _listbox lbSetTooltip [_index * (count lnbGetColumnsPosition _listbox), _x];
        _listbox lnbSetColor [[_index, 1], [1, 1, 1, _alpha]];
        _listbox lnbSetColor [[_index, 2], [1, 1, 1, _alpha]];
    };
} forEach _categoryItems;

_listbox lnbSort [1];
