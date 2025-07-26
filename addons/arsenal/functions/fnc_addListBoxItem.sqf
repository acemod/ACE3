#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Dedmen, johnb43
 * Add a listbox row.
 *
 * NOTE: This function contains workarounds for mixed control types in the Arsenal system.
 * See inline TODO comments for details on technical debt that should be addressed.
 *
 * Arguments:
 * 0: Config category, must be "CfgWeapons", "CfgVehicles", "CfgMagazines", "CfgVoice" or "CfgUnitInsignia" <STRING>
 * 1: Classname (must be in config case) <STRING>
 * 2: Panel control <CONTROL>
 * 3: Name of the picture entry in that Cfg class <STRING> (default: "picture")
 * 4: Config root <NUMBER> (default: 0 -> configFile)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["CfgWeapons", "launch_NLAW_F", _ctrl, "icon"] call ace_arsenal_fnc_addListBoxItem
 *
 * Public: Yes
 */

params ["_configCategory", "_className", "_ctrlPanel", ["_pictureEntryName", "picture", [""]], ["_configRoot", 0, [0]]];


private _skip = GVAR(favoritesOnly) && {!(_className in GVAR(currentItems))} && {!((toLowerANSI _className) in GVAR(favorites))};
if (_skip) then {
    switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonPrimaryWeapon: {
            _skip = !(_className in (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS));
        };
        case IDC_buttonHandgun: {
            _skip = !(_className in (GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS));
        };
        case IDC_buttonSecondaryWeapon: {
            _skip = !(_className in (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS));
        };
        case IDC_buttonBinoculars: {
            _skip = !(_className in (GVAR(currentItems) select IDX_CURR_BINO_ITEMS));
        };
    };
};

if (_skip) exitWith {};

private _key = _configCategory + _className + str _configRoot;

// If not in cache, find info and cache it for later use
((uiNamespace getVariable QGVAR(addListBoxItemCache)) getOrDefaultCall [_key, {
    // Get classname (config case), display name, picture and DLC
    private _configPath = ([configFile, campaignConfigFile, missionConfigFile] select _configRoot) >> _configCategory >> _className;

    // If _pictureEntryName is empty, then this item has no picture (e.g. faces)
    [configName _configPath, getText (_configPath >> "displayName"), if (_pictureEntryName == "") then {""} else {getText (_configPath >> _pictureEntryName)}]
}, true]) params ["_className", "_displayName", "_itemPicture"];

private _picture = switch (GVAR(enableModIcons)) do {
    case 0: {
        ""
    };
    case 1: {
        (uiNamespace getVariable QGVAR(modPictureCache)) getOrDefaultCall [_key, {
            // Get classname (config case), display name, picture and DLC
            private _configPath = ([configFile, campaignConfigFile, missionConfigFile] select _configRoot) >> _configCategory >> _className;
            private _dlcName = _configPath call EFUNC(common,getAddon);

            // If _pictureEntryName is empty, then this item has no picture (e.g. faces)
            if (_dlcName != "") then {
                (modParams [_dlcName, ["logo"]]) param [0, ""]
            } else {
                ""
            };
        }, true]
    };
    case 2: {
        (uiNamespace getVariable QGVAR(dlcPictureCache)) getOrDefaultCall [_key, {
            // Get classname (config case), display name, picture and DLC
            private _configPath = ([configFile, campaignConfigFile, missionConfigFile] select _configRoot) >> _configCategory >> _className;

            // Get DLC requirements
            private _dlcClass = (_configPath call EFUNC(common,getDLC)) select 0;

            if (_dlcClass != "") then {
                getText (configFile >> "CfgMods" >> _dlcClass >> "logo")
            } else {
                ""
            };
        }, true]
    };
};


private _lbAdd = -1;
private _controlType = ctrlType _ctrlPanel;

// TODO: This control type detection is a workaround needed because the Arsenal system
// uses different control types (listbox, listnbox, tree) for different panels but calls
// the same addListBoxItem function for all of them. This should be refactored to either:
// 1. Use consistent control types across all panels, OR
// 2. Create separate functions for each control type (addTreeItem, addListBoxItem, etc.)
// 
// Current workaround: Detect control type at runtime and use appropriate commands
// - Listbox (CT_LISTBOX = 5): lbAdd, lbSetData, lbSetPicture, etc.
// - Listnbox (CT_LISTNBOX = 102): lnbAddRow, lnbSetData, lnbSetPicture, etc.  
// - Tree (CT_TREE = 12): tvAdd, tvSetData, tvSetPicture, etc.
switch (_controlType) do {
    case 5: {
        _lbAdd = _ctrlPanel lbAdd _displayName;
        _ctrlPanel lbSetData [_lbAdd, _className];
        _ctrlPanel lbSetPicture [_lbAdd, _itemPicture];
        _ctrlPanel lbSetPictureRight [_lbAdd, _picture];
        _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _className]];
    };
    case 102: {
        _lbAdd = _ctrlPanel lnbAddRow ["", _displayName, "0"];
        _ctrlPanel lnbSetData [[_lbAdd, 0], _className];
        _ctrlPanel lnbSetPicture [[_lbAdd, 0], _itemPicture];
        _ctrlPanel lnbSetTooltip [[_lbAdd, 0], format ["%1\n%2", _displayName, _className]];
    };
    case 12: {
        _lbAdd = _ctrlPanel tvAdd [[], _displayName];
        _ctrlPanel tvSetData [[_lbAdd], _className];
        _ctrlPanel tvSetPicture [[_lbAdd], _itemPicture];
        _ctrlPanel tvSetTooltip [[_lbAdd], format ["%1\n%2", _displayName, _className]];
    };
    default {};
};


if ((toLowerANSI _className) in GVAR(favorites)) then {
    switch (_controlType) do {
        case 5: {
            _ctrlPanel lbSetColor [_lbAdd, FAVORITES_COLOR];
            _ctrlPanel lbSetSelectColor [_lbAdd, FAVORITES_COLOR];
        };
        case 102: {
            _ctrlPanel lnbSetColor [[_lbAdd, 1], FAVORITES_COLOR];
            _ctrlPanel lnbSetColorRight [[_lbAdd, 1], FAVORITES_COLOR];
        };
        case 12: {
            _ctrlPanel tvSetColor [[_lbAdd], FAVORITES_COLOR];
        };
    };
};
