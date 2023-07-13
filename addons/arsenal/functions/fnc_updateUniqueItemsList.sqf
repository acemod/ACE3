#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Updates the list of unique items.
 * Unique items are items that can't be multiplied using the arsenal.
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

private _isMagazine = false;
private _isWeapon = false;
private _config = configNull;
private _simulationType = "";
private _configItemInfo = "";
private _hasItemInfo = false;
private _itemInfoType = 0;
private _isMiscItem = false;

{
    _isMagazine = isClass (_cfgMagazines >> _x);
    _isWeapon = isClass (_cfgWeapons >> _x);

    switch (true) do {
        // Magazines
        case (_isMagazine): {
            _config = _cfgMagazines >> _x;

            switch (true) do {
                // "Misc. items" magazines (e.g. spare barrels, intel, photos)
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)) &&
                    {_x in (uiNamespace getVariable QGVAR(magazineMiscItems)) ||
                    {getNumber (_config >> "ACE_isUnique") == 1}}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_MISC_ITEMS) set [_x, nil];
                };
                // Primary, Handgun, Secondary weapon magazines
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL)) &&
                    {_x in (_configItems get IDX_VIRT_ITEMS_ALL) ||
                    {getNumber (_config >> QGVAR(hide)) == -1} ||
                    {getNumber (_config >> "type") in [TYPE_MAGAZINE_PRIMARY_AND_THROW, TYPE_MAGAZINE_SECONDARY_AND_PUT, 1536, TYPE_MAGAZINE_HANDGUN_AND_GL, TYPE_MAGAZINE_MISSILE]}}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL) set [_x, nil];
                };
                // Grenades
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_GRENADES)) &&
                    {_x in (uiNamespace getVariable QGVAR(grenadeCache))}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_GRENADES) set [_x, nil];
                };
                // Explosives
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_EXPLOSIVES)) &&
                    {_x in (uiNamespace getVariable QGVAR(putCache))}
                ): {
                    (GVAR(virtualItems) get IDX_VIRT_UNIQUE_EXPLOSIVES) set [_x, nil];
                };
                // Unknown
                default {
                    // Don't add items that are part of the arsenal
                    if !(_x in GVAR(virtualItemsFlatAll)) then {
                        (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x, nil];
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
            _isMiscItem = _className isKindOf ["CBA_MiscItem", _cfgWeapons];

            switch (true) do {
                // Optics
                case (
                    !(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS)) &&
                    {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_OPTICS}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) set [_x, nil];
                };
                // Flashlights
                case (
                    !(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)) &&
                    {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_FLASHLIGHT}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) set [_x, nil];
                };
                // Muzzle attachments
                case (
                    !(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS)) &&
                    {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_MUZZLE}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) set [_x, nil];
                };
                // Bipods
                case (
                    !(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS)) &&
                    {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) ||
                    {_hasItemInfo &&
                    {!_isMiscItem} &&
                    {_itemInfoType == TYPE_BIPOD}}}
                ): {
                    ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) set [_x, nil];
                };
                // Misc. items
                case (
                    !(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS)) &&
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
                    // Don't add items that are part of the arsenal
                    if !(_x in GVAR(virtualItemsFlatAll)) then {
                        (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x, nil];
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
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_GOGGLES) set [_x, nil];
        };
        // Unknown
        default {
            // Don't add items that are part of the arsenal
            if !(_x in GVAR(virtualItemsFlatAll)) then {
                (GVAR(virtualItems) get IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) set [_x, nil];
            };
        };
    };
} forEach (keys ([GVAR(center), 0, 3, 3, 3, false] call EFUNC(common,uniqueUnitItems))); // Get all items from unit
