#include "..\script_component.hpp"
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

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

private _weapons = GVAR(virtualItems) get IDX_VIRT_WEAPONS;
private _attachments = GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS;

private _name = "";
private _nullItemsAmount = 0;
private _unavailableItemsAmount = 0;
private _nullItemsList = [];
private _unavailableItemsList = [];

// Search for all items and turn them into config case; Don't touch other value types
private _fnc_toConfigCase = {
    _this apply {
        if (_x isEqualType "") then {
            if (_x != "") then {
                _name = _x call EFUNC(common,getConfigName);

                // If item doesn't exist in config, "" is returned
                // Just return unaltered item name in that case, so it can be documented as being unavailable
                if (_name != "") then {
                    _name
                } else {
                    _x
                };
            } else {
                _x
            };
        } else {
            // Handle arrays
            if (_x isEqualType []) then {
                _x call _fnc_toConfigCase
            } else {
                // All other types
                _x
            };
        };
    };
};

// Convert loadout to config case
// Loadout might come from a different modpack, which might have different config naming
_loadout = _loadout call _fnc_toConfigCase;

// Check a weapon, with its attachments and magazines, if items are available
private _fnc_weaponCheck = {
    params ["_weaponArray", ["_index", -1]];

    {
        // Weapons and attachments
        if (_x isEqualType "") then {
            if (_x != "") then {
                // Check if item exists
                if (isClass (_cfgWeapons >> _x)) then {
                    // Get base weapon
                    _x = _x call FUNC(baseWeapon);

                    // Check if item is available in arsenal
                    if !(
                        // Weapon class name is at the very start of the array
                        if (_forEachIndex == 0) then {
                            // If the type of weapon is known, only look through that array
                            if (_index != -1) then {
                                // If binos, choose differently
                                if (_index == IDX_LOADOUT_BINO) then {
                                    _x in (GVAR(virtualItems) get IDX_VIRT_BINO)
                                } else {
                                    _x in (_weapons get _index)
                                };
                            } else {
                                _x in (_weapons get IDX_VIRT_PRIMARY_WEAPONS) ||
                                {_x in (_weapons get IDX_VIRT_SECONDARY_WEAPONS)} ||
                                {_x in (_weapons get IDX_VIRT_HANDGUN_WEAPONS)} ||
                                {_x in (GVAR(virtualItems) get IDX_VIRT_BINO)}
                            };
                        } else {
                            _x in (_attachments get IDX_VIRT_OPTICS_ATTACHMENTS) ||
                            {_x in (_attachments get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)} ||
                            {_x in (_attachments get IDX_VIRT_MUZZLE_ATTACHMENTS)} ||
                            {_x in (_attachments get IDX_VIRT_BIPOD_ATTACHMENTS)}
                        }
                    ) then {
                        _unavailableItemsList pushBackUnique _x;
                        _weaponArray set [_forEachIndex, ""];
                        INC(_unavailableItemsAmount);
                    };
                } else {
                    _nullItemsList pushBackUnique _x;
                    _weaponArray set [_forEachIndex, ""];
                    INC(_nullItemsAmount);
                };
            };
        } else {
            // Magazines
            if (_x isNotEqualTo []) then {
                _x params ["_magazine"];

                // Check if item exists
                if (isClass (_cfgMagazines >> _magazine)) then {
                    // Check if item is available in arsenal
                    if !(_magazine in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL)) then {
                        _unavailableItemsList pushBackUnique _magazine;
                        _weaponArray set [_forEachIndex, []];
                        INC(_unavailableItemsAmount);
                    };
                } else {
                    _nullItemsList pushBackUnique _magazine;
                    _weaponArray set [_forEachIndex, []];
                    INC(_nullItemsAmount);
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
            [_loadout select _dataIndex, _dataIndex] call _fnc_weaponCheck;
        };
        // Uniform, vest, backpack
        case IDX_LOADOUT_UNIFORM;
        case IDX_LOADOUT_VEST;
        case IDX_LOADOUT_BACKPACK: {
            (_loadout select _dataIndex) params [["_item", ""], ["_containerItems", []]];

            if (_item != "") then {
                // Check if item exists
                if (isClass (_cfgVehicles >> _item) || {isClass (_cfgWeapons >> _item)}) then {
                    // Check if item is available in arsenal
                    if !(_item in (GVAR(virtualItems) get (_dataIndex + 1))) then {
                        _unavailableItemsList pushBackUnique _item;
                        _loadout set [_dataIndex, []];
                        INC(_unavailableItemsAmount);
                    } else {
                        {
                            switch (true) do {
                                // Magazines have each 3 entries: Name, number of magazines and ammo count
                                case (_x isEqualTypeArray ["", 0, 0]): {
                                    _x params ["_item"];

                                    // Check if item exists
                                    if (isClass (_cfgMagazines >> _item)) then {
                                        // Check if item is available in arsenal
                                        if !(
                                            _item in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL) ||
                                            {_item in (GVAR(virtualItems) get IDX_VIRT_GRENADES)} ||
                                            {_item in (GVAR(virtualItems) get IDX_VIRT_EXPLOSIVES)} ||
                                            {_item in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)}
                                        ) then {
                                            _unavailableItemsList pushBackUnique _item;
                                            ((_loadout select _dataIndex) select 1) set [_forEachIndex, []];
                                            INC(_unavailableItemsAmount);
                                        };
                                    } else {
                                        _nullItemsList pushBackUnique _item;
                                        ((_loadout select _dataIndex) select 1) set [_forEachIndex, []];
                                        INC(_nullItemsAmount);
                                    };
                                };
                                // Weapons have 2 entries: Weapon info array and amount
                                case (_x isEqualTypeArray [[], 0]): {
                                    [_x select 0] call _fnc_weaponCheck;
                                };
                                // Misc. items have 2 entries: Name and amount, containers have 2 entries: Name and isBackpack
                                default {
                                    _x params ["_item"];

                                    // Check if item exists
                                    if (
                                        isClass (_cfgWeapons >> _item) ||
                                        {isClass (_cfgMagazines >> _item)} ||
                                        {isClass (_cfgGlasses >> _item)} ||
                                        {isClass (_cfgVehicles >> _item)}
                                    ) then {
                                        // Check if item is available in arsenal
                                        if !(_item in GVAR(virtualItemsFlat)) then {
                                            _unavailableItemsList pushBackUnique _item;
                                            ((_loadout select _dataIndex) select 1) set [_forEachIndex, []];
                                            INC(_unavailableItemsAmount);
                                        };
                                    } else {
                                        _nullItemsList pushBackUnique _item;
                                        ((_loadout select _dataIndex) select 1) set [_forEachIndex, []];
                                        INC(_nullItemsAmount);
                                    };
                                };

                            };
                        } forEach _containerItems;
                    };
                } else {
                    _nullItemsList pushBackUnique _item;
                    _loadout set [_dataIndex, []];
                    INC(_nullItemsAmount);
                };
            };
        };
        // Headgear
        case IDX_LOADOUT_HEADGEAR: {
            _item = _loadout select _dataIndex;

            if (_item != "") then {
                // Check if item exists
                if (isClass (_cfgWeapons >> _item)) then {
                    // Check if item is available in arsenal
                    if !(_item in (GVAR(virtualItems) get IDX_VIRT_HEADGEAR)) then {
                        _unavailableItemsList pushBackUnique _item;
                        _loadout set [_dataIndex, ""];
                        INC(_unavailableItemsAmount);
                    };
                } else {
                    _nullItemsList pushBackUnique _item;
                    _loadout set [_dataIndex, ""];
                    INC(_nullItemsAmount);
                };
            };
        };
        // Facewear
        case IDX_LOADOUT_GOGGLES: {
            _item = _loadout select _dataIndex;

            if (_item != "") then {
                // Check if item exists
                if (isClass (_cfgGlasses >> _item)) then {
                    // Check if item is available in arsenal
                    if !(_item in (GVAR(virtualItems) get IDX_VIRT_GOGGLES)) then {
                        _unavailableItemsList pushBackUnique _item;
                        _loadout set [_dataIndex, ""];
                        INC(_unavailableItemsAmount);
                    };
                } else {
                    _nullItemsList pushBackUnique _item;
                    _loadout set [_dataIndex, ""];
                    INC(_nullItemsAmount);
                };
            };
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            private _assignedItems = _loadout select _dataIndex;

            for "_subIndex" from 0 to 5 do {
                _item = _assignedItems select _subIndex;

                if (_item != "") then {
                    // Check if item exists
                    if (isClass (_cfgWeapons >> _item)) then {
                        // Check if item is available in arsenal
                        if !(_item in (GVAR(virtualItems) get (IDX_VIRT_NVG + ([2, 6, 4, 3, 5, 0] select _subIndex)))) then {
                            _unavailableItemsList pushBackUnique _item;
                            _assignedItems set [_subIndex, ""];
                            INC(_unavailableItemsAmount);
                        };
                    } else {
                        _nullItemsList pushBackUnique _item;
                        _assignedItems set [_subIndex, ""];
                        INC(_nullItemsAmount);
                    };
                };
            };
        };
    };
};

[[_loadout, _extendedInfo], _nullItemsAmount, _unavailableItemsAmount, _nullItemsList, _unavailableItemsList]
