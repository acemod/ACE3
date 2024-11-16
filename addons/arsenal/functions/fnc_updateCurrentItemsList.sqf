#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: johnb43
 * Updates the list of current items.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

GVAR(currentItems) = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", [], [], [], [], [], [], []];

private _isWeapon = false;
private _indexCurrentItems = -1;

// Add the items the player has to currentItems
{
    switch (_forEachIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_LOADOUT_PRIMARY_WEAPON;
        case IDX_LOADOUT_SECONDARY_WEAPON;
        case IDX_LOADOUT_HANDGUN_WEAPON;
        case IDX_LOADOUT_BINO: {
            _x params [["_weapon", ""], ["_muzzle", ""], ["_flashlight", ""], ["_optics", ""], ["_primaryMagazine", []], ["_secondaryMagazine", []], ["_bipod", ""]];

            // Find baseweapon of weapon
            if (_weapon != "") then {
                _weapon = _weapon call FUNC(baseWeapon);
            };

            _isWeapon = _forEachIndex != IDX_LOADOUT_BINO;

            // If bino, add it in a different place than regular weapons
            GVAR(currentItems) set [[IDX_CURR_BINO, _forEachIndex] select _isWeapon, _weapon];

            _indexCurrentItems = [IDX_CURR_BINO_ITEMS, IDX_CURR_PRIMARY_WEAPON_ITEMS + _forEachIndex] select _isWeapon;

            // Add weapon attachments
            {
                (GVAR(currentItems) select _indexCurrentItems) set [[2, 1, 0, 3] select _forEachIndex, if (_x != "") then {_x call FUNC(baseWeapon)} else {_x}];
            } forEach [_optics, _flashlight, _muzzle, _bipod];

            // Add magazines
            {
                // Magazines are at index 4 & 5 in array -> That's why +4
                (GVAR(currentItems) select _indexCurrentItems) set [_forEachIndex + 4, _x param [0, ""]];
            } forEach [_primaryMagazine, _secondaryMagazine];
        };
        // Uniform
        case IDX_LOADOUT_UNIFORM: {
            GVAR(currentItems) set [IDX_CURR_UNIFORM, _x param [0, ""]];
            GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, _x param [1, []]];
        };
        // Vest
        case IDX_LOADOUT_VEST: {
            GVAR(currentItems) set [IDX_CURR_VEST, _x param [0, ""]];
            GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, _x param [1, []]];
        };
        // Backpack
        case IDX_LOADOUT_BACKPACK: {
            _x params [["_backpack", ""], ["_items", []]];
            if (_backpack != "") then {
                _backpack = [_backpack, "CfgVehicles"] call CBA_fnc_getNonPresetClass;
            };
            GVAR(currentItems) set [IDX_CURR_BACKPACK, _backpack];
            GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, _items];
        };
        // Helmet
        case IDX_LOADOUT_HEADGEAR: {
            GVAR(currentItems) set [IDX_CURR_HEADGEAR, _x];
        };
        // Facewear
        case IDX_LOADOUT_GOGGLES: {
            GVAR(currentItems) set [IDX_CURR_GOGGLES, _x];
        };
        // Assigned items: Map, Compass, Watch, GPS / UAV Terminal, Radio, NVGs
        case IDX_LOADOUT_ASSIGNEDITEMS: {
            {
                // Order of storing currentItems is different than what getUnitLoadout returns, so do some math
                GVAR(currentItems) set [IDX_CURR_NVG + ([2, 6, 4, 3, 5, 0] select _forEachIndex), _x];
            } forEach _x;
        };
    };
} forEach (getUnitLoadout GVAR(center)); // Only need items, not extended loadout
