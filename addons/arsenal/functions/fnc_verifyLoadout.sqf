#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Verify the provided loadout: Check what items do not exist and what items aren't available in current arsenal.
 *
 * Arguments:
 * 0: Loadout <ARRAY> (CBA Extended Loadout or getUnitLoadout format)
 *
 * Return Value:
 * Verified loadout and missing / unavailable items list and count <ARRAY>
 *
 * Public: No
*/

params ["_loadout"];

private _extendedInfo = createHashMap;

// Check if the provided loadout is a CBA extended loadout
if (count _loadout == 2) then {
    _extendedInfo = _loadout select 1;
    _loadout = _loadout select 0;
};

private _name = "";
private _nullItemsList = [];
private _unavailableItemsList = [];

// Search for all items and turn them into config case; Don't touch other value types
private _fnc_toConfigCase = {
    _this apply {
        if (_x isEqualType "" && {_x != ""}) then {
            _name = _x call EFUNC(common,getConfigName);

            // If item doesn't exist in config, "" is returned
            if (_name == "") then {
                _nullItemsList pushBack _x;
            };
            _name
        } else {
            // Handle arrays
            if (_x isEqualType []) then {
                _x call _fnc_toConfigCase
            } else {
                // All other types and empty strings
                _x
            };
        };
    };
};

// Convert loadout to config case and replace null items
// Loadout might come from a different modpack, which might have different config naming
_loadout = _loadout call _fnc_toConfigCase;

// Check a weapon, with its attachments and magazines, if items are available
private _fnc_weaponCheck = {
    params ["_weaponArray"];

    {
        // Weapons and attachments
        if (_x isEqualType "") then {
            if (_x != "") then {
                // Get base weapon
                _x = _x call FUNC(baseWeapon);

                // Check if item is available in arsenal
                if !(_x in GVAR(virtualItemsFlatAll)) then {
                    _unavailableItemsList pushBack _x;
                    _weaponArray set [_forEachIndex, ""];
                };
            };
        } else {
            // Magazines
            if (_x isNotEqualTo []) then {
                _x params ["_magazine"];

                // Check if item is available in arsenal
                if !(_magazine in GVAR(virtualItemsFlatAll)) then {
                    _unavailableItemsList pushBack _magazine;
                    _weaponArray set [_forEachIndex, []];
                };
            };
        };
    } forEach _weaponArray;
};

private _item = "";

// Go through entire loadout to check if items are available in current arsenal
for "_dataIndex" from IDX_LOADOUT_PRIMARY_WEAPON to IDX_LOADOUT_ASSIGNEDITEMS do {
    switch (_dataIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_LOADOUT_PRIMARY_WEAPON;
        case IDX_LOADOUT_SECONDARY_WEAPON;
        case IDX_LOADOUT_HANDGUN_WEAPON;
        case IDX_LOADOUT_BINO: {
            [_loadout select _dataIndex] call _fnc_weaponCheck;
        };
        // Uniform, vest, backpack
        case IDX_LOADOUT_UNIFORM;
        case IDX_LOADOUT_VEST;
        case IDX_LOADOUT_BACKPACK: {
            (_loadout select _dataIndex) params [["_item", ""], ["_containerItems", []]];

            if !(_item in GVAR(virtualItemsFlatAll)) then {
                _unavailableItemsList pushBack _item;
                _loadout set [_dataIndex, []];
                continue
            };

            {
                _x params ["_item"];

                if (_item isEqualType []) then {
                    _x call _fnc_weaponCheck;
                    continue
                };


                if !(_item in GVAR(virtualItemsFlatAll)) then {
                    _unavailableItemsList pushBack _item;
                    _containerItems set [_forEachIndex, []];
                };
            } forEach _containerItems;
        };
        // Headgear & Facewear
        case IDX_LOADOUT_HEADGEAR;
        case IDX_LOADOUT_GOGGLES: {
            _item = _loadout select _dataIndex;

            if !(_item in GVAR(virtualItemsFlatAll)) then {
                _unavailableItemsList pushBack _item;
                _loadout set [_dataIndex, ""];
            };
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            private _assignedItems = _loadout select _dataIndex;

            {
                if !(_x in GVAR(virtualItemsFlatAll)) then {
                    _unavailableItemsList pushBack _x;
                    _assignedItems set [_forEachIndex, ""];
                }
            } forEach _assignedItems;
        };
    };
};

[[_loadout, _extendedInfo], _nullItemsList arrayIntersect _nullItemsList, _unavailableItemsList arrayIntersect _unavailableItemsList]
