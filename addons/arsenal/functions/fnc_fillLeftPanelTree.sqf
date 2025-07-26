#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Populates the arsenal left panel tree with items grouped by mod/DLC.
 *
 * Arguments:
 * 0: Config category <STRING>
 * 1: Items array <ARRAY>
 * 2: Tree control <CONTROL>
 * 3: Picture entry name <STRING> (default: "picture")
 *
 * Return Value:
 * None
 *
 * Example:
 * ["CfgWeapons", _weaponsList, _treeCtrl] call ace_arsenal_fnc_fillLeftPanelTree
 *
 * Public: No
 */

params ["_configCategory", "_items", "_treeCtrl", ["_pictureEntryName", "picture", [""]]];

// Clear existing tree
tvClear _treeCtrl;

// Early exit if no items
if (count _items == 0) exitWith {};

// Group items by mod/DLC
private _groups = createHashMap;
private _key = "";
private _groupName = "";

{
    _key = _configCategory + _x;
    
    // Get group name from cache or determine it
    _groupName = (uiNamespace getVariable QGVAR(itemGroupCache)) getOrDefaultCall [_key, {
        // Get the item's config
        private _configPath = configFile >> _configCategory >> _x;
        private _dlcName = _configPath call EFUNC(common,getAddon);
        
        // Determine group name based on DLC/mod
        if (_dlcName == "") then {
            "Arma 3" // Base game
        } else {
            private _modInfo = modParams [_dlcName, ["name"]];
            if (count _modInfo > 0 && {(_modInfo select 0) != ""}) then {
                _modInfo select 0
            } else {
                "Unknown" // Fallback for unidentified mods
            };
        };
    }, true];
    
    // Add item to group
    private _groupItems = _groups getOrDefault [_groupName, []];
    _groupItems pushBack _x;
    _groups set [_groupName, _groupItems];
} forEach _items;

// Sort groups alphabetically, but keep "Arma 3" at the top
private _sortedGroupNames = keys _groups;
_sortedGroupNames sort true;

private _armaIndex = _sortedGroupNames find "Arma 3";
if (_armaIndex != -1) then {
    _sortedGroupNames deleteAt _armaIndex;
    _sortedGroupNames = ["Arma 3"] + _sortedGroupNames;
};

// Add groups and items to tree
{
    private _groupName = _x;
    private _groupItems = _groups get _groupName;
    
    // Sort items within group by display name - build sortable array
    private _itemsWithNames = _groupItems apply {
        private _displayName = getText (configFile >> _configCategory >> _x >> "displayName");
        [_displayName, _x]
    };
    _itemsWithNames sort true;
    _groupItems = _itemsWithNames apply {_x select 1};
    
    // Add group node
    private _groupIndex = _treeCtrl tvAdd [[], format ["%1 (%2)", _groupName, count _groupItems]];
    _treeCtrl tvSetData [[_groupIndex], format ["GROUP_%1", _groupName]];
    _treeCtrl tvExpand [_groupIndex]; // Default to expanded for better UX
    
    // Add item nodes
    {
        // Get item info from cache (reuse existing cache logic)
        private _itemKey = _configCategory + _x;
        ((uiNamespace getVariable QGVAR(addListBoxItemCache)) getOrDefaultCall [_itemKey, {
            private _configPath = configFile >> _configCategory >> _x;
            [configName _configPath, getText (_configPath >> "displayName"), if (_pictureEntryName == "") then {""} else {getText (_configPath >> _pictureEntryName)}]
        }, true]) params ["_className", "_displayName", "_itemPicture"];
        
        // Skip favorites-only filter if enabled
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
        
        if (!_skip) then {
            private _itemIndex = _treeCtrl tvAdd [[_groupIndex], _displayName];
            _treeCtrl tvSetData [[_groupIndex, _itemIndex], _className];
            _treeCtrl tvSetPicture [[_groupIndex, _itemIndex], _itemPicture];
            _treeCtrl tvSetTooltip [[_groupIndex, _itemIndex], format ["%1\n%2", _displayName, _className]];
            
            // Set mod icon if enabled
            if (GVAR(enableModIcons) > 0) then {
                private _modPicture = switch (GVAR(enableModIcons)) do {
                    case 1: {
                        (uiNamespace getVariable QGVAR(modPictureCache)) getOrDefaultCall [_itemKey, {
                            private _configPath = configFile >> _configCategory >> _className;
                            private _dlcName = _configPath call EFUNC(common,getAddon);
                            if (_dlcName != "") then {
                                (modParams [_dlcName, ["logo"]]) param [0, ""]
                            } else {
                                ""
                            };
                        }, true]
                    };
                    case 2: {
                        (uiNamespace getVariable QGVAR(dlcPictureCache)) getOrDefaultCall [_itemKey, {
                            private _configPath = configFile >> _configCategory >> _className;
                            private _dlcClass = (_configPath call EFUNC(common,getDLC)) select 0;
                            if (_dlcClass != "") then {
                                getText (configFile >> "CfgMods" >> _dlcClass >> "logo")
                            } else {
                                ""
                            };
                        }, true]
                    };
                };
                
                if (_modPicture != "") then {
                    _treeCtrl tvSetPictureRight [[_groupIndex, _itemIndex], _modPicture];
                };
            };
            
            // Set favorites color
            if ((toLowerANSI _className) in GVAR(favorites)) then {
                _treeCtrl tvSetPictureColor [[_groupIndex, _itemIndex], FAVORITES_COLOR];
            };
        };
    } forEach _groupItems;
} forEach _sortedGroupNames;
