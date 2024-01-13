#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Updates the list of unique inventory items and unique equipment.
 * Unique inventory items are items within containers that can't be multiplied using the arsenal.
 * Unique equipment are any items (such as weapons, containers, etc.) that can't be multiplied using the arsenal.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

GVAR(virtualItems) set [IDX_VIRT_UNIQUE_MISC_ITEMS, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_GRENADES, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_EXPLOSIVES, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_BACKPACKS, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_GOGGLES, createHashMap];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_UNKNOWN_ITEMS, createHashMap];

private _configItems = uiNamespace getVariable QGVAR(configItems);

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

// Remove unique equipment in every panel
private _items = createHashMap;

private _fnc_uniqueEquipment = {
    params ["_items", "_item", ["_removeAllUniqueItems", true]];

    // Remove all unique equipment from tab
    if (_removeAllUniqueItems) then {
        private _itemsToDelete = [];

        {
            if (!isNil "_y") then {
                _itemsToDelete pushBack _x;
            };
        } forEach _items;

        {
            _items deleteAt _x;
            GVAR(virtualItemsFlatAll) deleteAt _x;
        } forEach _itemsToDelete;
    };

    // Add item as a unique equipment
    if (_item != "") then {
        _items set [_item, true, true];
        GVAR(virtualItemsFlatAll) set [_item, true, true];
    };
};

// Add the items the player has to virtualItems as unique equipment
{
    switch (_forEachIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_LOADOUT_PRIMARY_WEAPON;
        case IDX_LOADOUT_SECONDARY_WEAPON;
        case IDX_LOADOUT_HANDGUN_WEAPON;
        case IDX_LOADOUT_BINO: {
            _x params [["_weapon", ""], ["_muzzle", ""], ["_flashlight", ""], ["_optics", ""], ["_primaryMagazine", []], ["_secondaryMagazine", []], ["_bipod", ""]];

            // If bino, add it in a different place than regular weapons
            _items = if (_forEachIndex != IDX_LOADOUT_BINO) then {
                (GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _forEachIndex
            } else {
                GVAR(virtualItems) get IDX_VIRT_BINO
            };

            // Remove all unique equipment in tab; Add weapon as a unique equipment
            [_items, _weapon call FUNC(baseWeapon)] call _fnc_uniqueEquipment;

            private _removeUniqueItems = _forEachIndex == IDX_LOADOUT_PRIMARY_WEAPON;

            // Add weapon attachments
            {
                // Remove all unique equipment in tab; Add weapon attachment as a unique equipment
                [(GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get _forEachIndex, _x call FUNC(baseWeapon), _removeUniqueItems] call _fnc_uniqueEquipment;
            } forEach [_optics, _flashlight, _muzzle, _bipod];

            // Add magazines
            {
                // Remove all unique equipment in tab; Add magazine as unique equipment
                [GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL, _x param [0, ""], _removeUniqueItems && {_forEachIndex == 0}] call _fnc_uniqueEquipment;
            } forEach [_primaryMagazine, _secondaryMagazine];
        };

        // Uniform, vest, backpack
        case IDX_LOADOUT_UNIFORM;
        case IDX_LOADOUT_VEST;
        case IDX_LOADOUT_BACKPACK: {
            _x params [["_containerClass", ""]];

            // Remove all unique equipment in tab; Add container as a unique equipment
            [GVAR(virtualItems) get (_forEachIndex + 1), _containerClass] call _fnc_uniqueEquipment;
        };
        // Helmet
        case IDX_LOADOUT_HEADGEAR: {
            // Remove all unique equipment in tab; Add item as a unique equipment
            [GVAR(virtualItems) get IDX_VIRT_HEADGEAR, _x] call _fnc_uniqueEquipment;
        };
        // Facewear
        case IDX_LOADOUT_GOGGLES: {
            // Remove all unique equipment in tab; Add item as a unique equipment
            [GVAR(virtualItems) get IDX_VIRT_GOGGLES, _x] call _fnc_uniqueEquipment;
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            {
                // Order of storing virtualItems is different than what getUnitLoadout returns, so do some math
                // Remove all unique equipment in tab; Add item as a unique equipment
                [GVAR(virtualItems) get (IDX_VIRT_NVG + ([2, 6, 4, 3, 5, 0] select _forEachIndex)), _x] call _fnc_uniqueEquipment;
            } forEach _x;
        };
    };
} forEach (getUnitLoadout GVAR(center)); // Only need items, not extended loadout

// Get all items from unit
_items = itemsWithMagazines GVAR(center) + backpacks GVAR(center);
private _isMagazine = false;
private _isWeapon = false;
private _isGrenade = false;
private _isPut = false;
private _isMiscItem = false;
private _config = configNull;
private _simulationType = "";
private _configItemInfo = "";
private _hasItemInfo = false;
private _itemInfoType = 0;
private _baseWeapon = "";
private _weapons = GVAR(virtualItems) get IDX_VIRT_WEAPONS;
private _attachments = GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS;

{
    _isMagazine = isClass (_cfgMagazines >> _x);
    _isWeapon = isClass (_cfgWeapons >> _x);

    switch (true) do {
        // Magazines
        case (_isMagazine): {
            _config = _cfgMagazines >> _x;
            _isGrenade = _x in (uiNamespace getVariable QGVAR(grenadeCache));
            _isPut = _x in (uiNamespace getVariable QGVAR(putCache));
            _isMiscItem = _x in (uiNamespace getVariable QGVAR(magazineMiscItems));

            switch (true) do {
                // "Misc. items" magazines (e.g. spare barrels, intel, photos)
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)) &&
                    {_isMiscItem}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_MISC_ITEMS) set [_x, nil];
                };
                // Grenades
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_GRENADES)) &&
                    {_isGrenade}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_GRENADES) set [_x, nil];
                };
                // Explosives
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_EXPLOSIVES)) &&
                    {_isPut}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_EXPLOSIVES) set [_x, nil];
                };
                // Primary, Handgun, Secondary weapon magazines
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL)) &&
                    {!_isGrenade && {!_isPut} && {!_isMiscItem}} &&
                    {_x in (_configItems get IDX_VIRT_ITEMS_ALL) ||
                    {getNumber (_config >> QGVAR(hide)) == -1} ||
                    {getNumber (_config >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW, TYPE_MAGAZINE_SECONDARY_AND_PUT, 1536, TYPE_MAGAZINE_HANDGUN_AND_GL, TYPE_MAGAZINE_MISSILE]}}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL) set [_x, nil];
                };
                // Unknown
                default {
                    // Don't add items that are part of the arsenal
                    if (
                        !(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)) &&
                        {!(_x in (GVAR(virtualItems) get IDX_VIRT_GRENADES))} &&
                        {!(_x in (GVAR(virtualItems) get IDX_VIRT_EXPLOSIVES))} &&
                        {!(_x in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL))}
                    ) then {
                        (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x, true];
                    };
                };
            };
        };
        // Weapons
        case (_isWeapon): {
            _config = _cfgWeapons >> _x;
            _simulationType = getText (_config >> "simulation");
            _configItemInfo = _config >> "ItemInfo";
            _hasItemInfo = isClass (_configItemInfo);
            _itemInfoType = if (_hasItemInfo) then {getNumber (_configItemInfo >> "type")} else {0};
            _isMiscItem = _x isKindOf ["CBA_MiscItem", _cfgWeapons];

            _baseWeapon = if (!_isMiscItem) then {
                _x call FUNC(baseWeapon)
            } else {
                _x
            };

            switch (true) do {
                // Optics
                case (
                    !(_baseWeapon in (_attachments get IDX_VIRT_OPTICS_ATTACHMENTS)) &&
                    {_baseWeapon in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_OPTICS}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) set [_x, nil];
                };
                // Flashlights
                case (
                    !(_baseWeapon in (_attachments get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)) &&
                    {_baseWeapon in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_FLASHLIGHT}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) set [_x, nil];
                };
                // Muzzle attachments
                case (
                    !(_baseWeapon in (_attachments get IDX_VIRT_MUZZLE_ATTACHMENTS)) &&
                    {_baseWeapon in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_MUZZLE}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) set [_x, nil];
                };
                // Bipods
                case (
                    !(_baseWeapon in (_attachments get IDX_VIRT_BIPOD_ATTACHMENTS)) &&
                    {_baseWeapon in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_BIPOD}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) set [_x, nil];
                };
                // Misc. items
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)) && // misc. items don't use 'baseWeapon'
                    {_x in (_configItems get IDX_VIRT_MISC_ITEMS) ||
                    {_hasItemInfo &&
                    {_isMiscItem &&
                    {_itemInfoType in [TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_MUZZLE, TYPE_BIPOD]}} ||
                    {_itemInfoType in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]} ||
                    {_simulationType == "ItemMineDetector"}}}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_MISC_ITEMS) set [_x, nil];
                };
                // Unknown
                default {
                    // Don't add attachments or misc. items
                    if (
                        !(_baseWeapon in (_attachments get IDX_VIRT_OPTICS_ATTACHMENTS)) &&
                        {!(_baseWeapon in (_attachments get IDX_VIRT_FLASHLIGHT_ATTACHMENTS))} &&
                        {!(_baseWeapon in (_attachments get IDX_VIRT_MUZZLE_ATTACHMENTS))} &&
                        {!(_baseWeapon in (_attachments get IDX_VIRT_BIPOD_ATTACHMENTS))} &&
                        {!(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS))}
                    ) then {
                        // If item is a weapon (including binos), make it unique
                        (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x,
                            _baseWeapon in (_weapons get IDX_VIRT_PRIMARY_WEAPONS) ||
                            {_baseWeapon in (_weapons get IDX_VIRT_HANDGUN_WEAPONS)} ||
                            {_baseWeapon in (_weapons get IDX_VIRT_SECONDARY_WEAPONS)} ||
                            {_baseWeapon in (GVAR(virtualItems) get IDX_VIRT_BINO)}
                        ];
                    };
                };
            };
        };
        // Backpacks
        case (getNumber (_cfgVehicles >> _x >> "isBackpack") == 1): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_BACKPACKS) set [_x, nil];
        };
        // Facewear
        case (isClass (_cfgGlasses >> _x)): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_GOGGLES) set [_x, !(_x in (GVAR(virtualItems) get IDX_VIRT_GOGGLES))];
        };
        // Unknown
        default {
            // Don't add items that are part of the arsenal
            if !(_x in GVAR(virtualItemsFlatAll)) then {
                (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x, true];
            };
        };
    };
} forEach (_items arrayIntersect _items);
