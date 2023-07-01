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

GVAR(virtualItems) set [IDX_VIRT_UNIQUE_MISC_ITEMS, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_GRENADES, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_EXPLOSIVES, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_ATTACHMENTS, [[], [], [], []]];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_BACKPACKS, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_GOGGLES, []];
GVAR(virtualItems) set [IDX_VIRT_UNIQUE_UNKNOWN_ITEMS, []];

private _configItems = uiNamespace getVariable [QGVAR(configItems), []];
private _configItemsFlat = uiNamespace getVariable [QGVAR(configItemsFlat), []];
private _magazineMiscItems = uiNamespace getVariable [QGVAR(magazineMiscItems), []];

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
            {!(_x in (GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL))} &&
            {_x in (_configItems select IDX_VIRT_ITEMS_ALL)}
        ): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL) pushBackUnique _x;
        };
        // Grenades
        case (
            _isMagazine &&
            {!(_x in (GVAR(virtualItems) select IDX_VIRT_GRENADES))} &&
            {_x in (_configItems select IDX_VIRT_GRENADES)}
        ): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_GRENADES) pushBackUnique _x;
        };
        // Explosives
        case (
            _isMagazine &&
            {!(_x in (GVAR(virtualItems) select IDX_VIRT_EXPLOSIVES))} &&
            {_x in (_configItems select IDX_VIRT_EXPLOSIVES)}
        ): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_EXPLOSIVES) pushBackUnique _x;
        };
        // Optics
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS))} &&
            {_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS) pushBackUnique _x;
        };
        // Flashlights
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS))} &&
            {_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS) pushBackUnique _x;
        };
        // Muzzle attachments
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS))} &&
            {_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS) pushBackUnique _x;
        };
        // Bipods
        case (
            _isWeapon &&
            {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS))} &&
            {_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS)}
        ): {
            ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS) pushBackUnique _x;
        };
        // Misc. items
        case (
            _isWeapon &&
            {!(_x in (GVAR(virtualItems) select IDX_VIRT_MISC_ITEMS))} &&
            {!(_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS))} &&
            {!(_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS))} &&
            {!(_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS))} &&
            {!(_x in ((_configItems select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS))}
        ): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_MISC_ITEMS) pushBackUnique _x;
        };
        // "Misc. items" magazines (e.g. spare barrels, intel, photos)
        case (
            _isMagazine &&
            {_x in _magazineMiscItems} &&
            {!(_x in (GVAR(virtualItems) select IDX_VIRT_MISC_ITEMS))} &&
            {_x in (_configItems select IDX_VIRT_MISC_ITEMS)}
        ): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_MISC_ITEMS) pushBackUnique _x;
        };
        // Backpacks
        case (getNumber (_cfgVehicles >> _x >> "isBackpack") == 1): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_BACKPACKS) pushBackUnique _x;
        };
        // Facewear
        case (isClass (_cfgGlasses >> _x)): {
            (GVAR(virtualItems) select IDX_VIRT_UNIQUE_GOGGLES) pushBackUnique _x;
        };
        // Unknown
        default {
            // Don't add items that are part of the arsenal
            if !(_x in _configItemsFlat) then {
                (GVAR(virtualItems) select IDX_VIRT_UNIQUE_UNKNOWN_ITEMS) pushBackUnique _x;
            };
        };
    };
} forEach (keys ([GVAR(center), 0, 3, 3, 3, false] call EFUNC(common,uniqueUnitItems))); // Get all items from unit
