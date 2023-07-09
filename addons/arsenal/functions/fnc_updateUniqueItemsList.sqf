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
private _configItemsFlat = uiNamespace getVariable QGVAR(configItemsFlat);
private _magazineMiscItems = uiNamespace getVariable QGVAR(magazineMiscItems);

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

private _isMagazine = false;
private _isWeapon = false;

{
    _isMagazine = isClass (_cfgMagazines >> _x);
    _isWeapon = isClass (_cfgWeapons >> _x);

    switch (true) do {
        // Primary, Handgun, Secondary weapon magazines
        case (
            _isMagazine &&
            {!(_x in (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL))} &&
            {_x in (_configItems get IDX_VIRT_ITEMS_ALL)}
        ): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL) set [_x, nil];
        };
        // Grenades
        case (
            _isMagazine &&
            {!(_x in (GVAR(virtualItems) get IDX_VIRT_GRENADES))} &&
            {_x in (_configItems get IDX_VIRT_GRENADES)}
        ): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_GRENADES) set [_x, nil];
        };
        // Explosives
        case (
            _isMagazine &&
            {!(_x in (GVAR(virtualItems) get IDX_VIRT_EXPLOSIVES))} &&
            {_x in (_configItems get IDX_VIRT_EXPLOSIVES)}
        ): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_EXPLOSIVES) set [_x, nil];
        };
        // Optics
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS))} &&
            {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS) set [_x, nil];
        };
        // Flashlights
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS))} &&
            {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS) set [_x, nil];
        };
        // Muzzle attachments
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS))} &&
            {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS) set [_x, nil];
        };
        // Bipods
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS))} &&
            {_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) get IDX_VIRT_UNIQUE_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS) set [_x, nil];
        };
        // Misc. items
        case (
            _isWeapon &&
            {!(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS))} &&
            {!(_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_OPTICS_ATTACHMENTS))} &&
            {!(_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_FLASHLIGHT_ATTACHMENTS))} &&
            {!(_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_MUZZLE_ATTACHMENTS))} &&
            {!(_x in ((_configItems get IDX_VIRT_ATTACHMENTS) get IDX_VIRT_BIPOD_ATTACHMENTS))}
        ): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_MISC_ITEMS) set [_x, nil];
        };
        // "Misc. items" magazines (e.g. spare barrels, intel, photos)
        case (
            _isMagazine &&
            {_x in _magazineMiscItems} &&
            {!(_x in (GVAR(virtualItems) get IDX_VIRT_MISC_ITEMS))} &&
            {_x in (_configItems get IDX_VIRT_MISC_ITEMS)}
        ): {
            (GVAR(virtualItems) get IDX_VIRT_UNIQUE_MISC_ITEMS) set [_x, nil];
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
