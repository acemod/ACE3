#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Populates the arsenal left panel tree with items using grouping (always enabled).
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
 * Public: No
 */

params ["_configCategory", "_items", "_treeCtrl", ["_pictureEntryName", "picture", [""]]];

// Early exit if no items
if (count _items == 0) exitWith {};

// Always use grouping (no flat display mode)
private _groupingMethod = GVAR(groupingMethod);
private _groups = createHashMap;
private _key = "";
private _groupName = "";

{
    _key = _configCategory + _x;
    
    // Determine group based on method
    if (_groupingMethod == 0) then {
        // Group by Mod/DLC
        _groupName = (uiNamespace getVariable QGVAR(itemGroupCache)) getOrDefaultCall [_key, {
            private _configPath = configFile >> _configCategory >> _x;
            private _dlcName = _configPath call EFUNC(common,getAddon);
            
            if (_dlcName == "") then {
                "Arma 3"
            } else {
                private _modInfo = modParams [_dlcName, ["name"]];
                if (count _modInfo > 0 && {(_modInfo select 0) != ""}) then {
                    _modInfo select 0
                } else {
                    "Unknown"
                };
            };
        }, true];
    } else {
        // Group by Class Inheritance
        _groupName = (uiNamespace getVariable QGVAR(classGroupCache)) getOrDefaultCall [_key, {
            private _configPath = configFile >> _configCategory >> _x;
            
            // Get the direct parent class name for grouping
            private _parentConfig = inheritsFrom _configPath;
            private _parentName = configName _parentConfig;
            
            // Use parent class name or fallback to "Base Classes" for root items
            ["Base Classes", _parentName] select (_parentName != "");
        }, true];
    };
    
    // Add item to group
    private _groupItems = _groups getOrDefault [_groupName, []];
    _groupItems pushBack _x;
    _groups set [_groupName, _groupItems];
} forEach _items;

// Sort groups alphabetically, but keep "Arma 3" at the top if grouping by mod
private _sortedGroupNames = keys _groups;
_sortedGroupNames sort true;

if (_groupingMethod == 0) then {
    private _armaIndex = _sortedGroupNames find "Arma 3";
    if (_armaIndex != -1) then {
        _sortedGroupNames deleteAt _armaIndex;
        _sortedGroupNames = ["Arma 3"] + _sortedGroupNames;
    };
};

// Add groups and items to tree
{
    private _groupName = _x;
    private _groupItems = _groups get _groupName;
    
    // Sort items within group by display name
    private _itemsWithNames = _groupItems apply {
        private _displayName = getText (configFile >> _configCategory >> _x >> "displayName");
        [_displayName, _x]
    };
    _itemsWithNames sort true;
    _groupItems = _itemsWithNames apply {_x select 1};
    
    // Add group node
    private _groupIndex = _treeCtrl tvAdd [[], format ["%1 (%2)", _groupName, count _groupItems]];
    _treeCtrl tvSetData [[_groupIndex], format ["GROUP_%1", _groupName]];
    _treeCtrl tvExpand [_groupIndex];
    
    // Add item nodes
    {
        // Use unified addListBoxItem function - it handles all logic including favorites filtering
        [_configCategory, _x, _treeCtrl, _pictureEntryName, 0, [_groupIndex]] call FUNC(addListBoxItem);
    } forEach _groupItems;
} forEach _sortedGroupNames;
