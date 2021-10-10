#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Update the list of unique items.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

GVAR(virtualItems) set [18, []];
GVAR(virtualItems) set [19, []];
GVAR(virtualItems) set [20, []];
GVAR(virtualItems) set [21, []];
GVAR(virtualItems) set [22, [[], [], [], []]];
GVAR(virtualItems) set [23, []];
GVAR(virtualItems) set [24, []];

private _array = LIST_DEFAULTS select IDX_VIRT_ITEMS_ALL;
private _itemsCache = uiNamespace getVariable QGVAR(configItems);

private _configCfgWeapons = configFile >> "CfgWeapons";
private _configMagazines = configFile >> "CfgMagazines";
private _configVehicles = configFile >> "CfgVehicles";
private _configGlasses = configFile >> "CfgGlasses";

{
    switch true do {
        // Weapon mag
        case (
                isClass (_configMagazines >> _x) &&
                {_x in (_itemsCache select 2)} &&
                {!(_x in (GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL))}
            ): {
            (GVAR(virtualItems) select 19) pushBackUnique _x;
        };

        // Mag throw
        case (
                isClass (_configMagazines >> _x) &&
                {_x in (_itemsCache select 15)} &&
                {!(_x in (GVAR(virtualItems) select 15))}
            ): {
            (GVAR(virtualItems) select 20) pushBackUnique _x;
        };

        // Mag put
        case (
                isClass (_configMagazines >> _x) &&
                {_x in (_itemsCache select 16)} &&
                {!(_x in (GVAR(virtualItems) select 16))}
            ): {
            (GVAR(virtualItems) select 21) pushBackUnique _x;
        };

        // acc
        case (
                isClass (_configCfgWeapons >> _x) &&
                {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHEMENTS) select 0))} &&
                {_x in ((_itemsCache select 1) select 0)}
            ): {
            ((GVAR(virtualItems) select 22) select 0) pushBackUnique _x;
        };

        // acc
        case (
                isClass (_configCfgWeapons >> _x) &&
                {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHEMENTS) select 1))} &&
                {_x in ((_itemsCache select 1) select 1)}
            ): {
            ((GVAR(virtualItems) select 22) select 1) pushBackUnique _x;
        };

        // acc
        case (
                isClass (_configCfgWeapons >> _x) &&
                {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHEMENTS) select 2))} &&
                {_x in ((_itemsCache select 1) select 2)}
            ): {
            ((GVAR(virtualItems) select 22) select 2) pushBackUnique _x;
        };
        // acc
        case (
                isClass (_configCfgWeapons >> _x) &&
                {!(_x in ((GVAR(virtualItems) select IDX_VIRT_ATTACHEMENTS) select 3))} &&
                {_x in ((_itemsCache select 1) select 3)}
            ): {
            ((GVAR(virtualItems) select 22) select 3) pushBackUnique _x;
        };

        // Misc
        case (
                isClass (_configCfgWeapons >> _x) &&
                {!(_x in (GVAR(virtualItems) select 17))} &&
                {!(_x in ((_itemsCache select 1) select 0))} &&
                {!(_x in ((_itemsCache select 1) select 1))} &&
                {!(_x in ((_itemsCache select 1) select 2))} &&
                {!(_x in ((_itemsCache select 1) select 3))}
            ): {
            (GVAR(virtualItems) select 18) pushBackUnique _x;
        };

        // Backpacks
        case (getNumber (_configVehicles >> _x >> "isBackpack") == 1): {
            (GVAR(virtualItems) select 23) pushBackUnique _x;
        };

        // Facewear
        case (isClass (_configGlasses >> _x)): {
            (GVAR(virtualItems) select 24) pushBackUnique _x;
        };
    };
} foreach _array;
