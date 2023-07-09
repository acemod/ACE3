#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Handles selection changes on the right panel.
 *
 * Arguments:
 * 0: Right panel control <CONTROL>
 * 1: Right panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};

private _display = ctrlParent _control;
private _item = _control lbData _curSel;
private _currentItemsIndex = IDX_CURR_PRIMARY_WEAPON_ITEMS + ([IDC_buttonPrimaryWeapon, IDC_buttonSecondaryWeapon, IDC_buttonHandgun, IDC_buttonBinoculars] find GVAR(currentLeftPanel));
private _itemIndex = [IDC_buttonMuzzle, IDC_buttonItemAcc, IDC_buttonOptic, IDC_buttonBipod, IDC_buttonCurrentMag, IDC_buttonCurrentMag2] find GVAR(currentRightPanel);

// Check which right panel has changed
switch (_currentItemsIndex) do {
    // Primary weapon
    case IDX_CURR_PRIMARY_WEAPON_ITEMS: {
        // If removal
        if (_item == "") then {
            GVAR(center) removePrimaryWeaponItem ((GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS) select _itemIndex);
        } else {
            // Don't add item if it isn't a different item than what the unit already has
            if (_item != ((GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS) select _itemIndex)) then {
                GVAR(center) addWeaponItem [primaryWeapon GVAR(center), _item, true];
            };
        };

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_PRIMARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Secondary weapon
    case IDX_CURR_SECONDARY_WEAPON_ITEMS: {
        private _isDisposable = CBA_disposable_replaceDisposableLauncher && {!isNil {CBA_disposable_loadedLaunchers getVariable (secondaryWeapon GVAR(center))}};

        // If removal
        if (_item == "") then {
            // Don't unload magazines from diposable weapons
            if (_isDisposable && {_itemIndex > 3}) exitWith {
                TRACE_1("Ignoring unload of magazine from disposable",secondaryWeapon GVAR(center));
            };

            GVAR(center) removeSecondaryWeaponItem ((GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS) select _itemIndex);
        } else {
            // Don't add item if it isn't a different item than what the unit already has
            if (_item != ((GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS) select _itemIndex)) then {
                GVAR(center) addWeaponItem [secondaryWeapon GVAR(center), _item, true];
            };
        };

        // Update currentItems
        if !(_isDisposable && {_itemIndex > 3}) then {
            (getUnitLoadout GVAR(center) select IDX_LOADOUT_SECONDARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
            GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];
        };

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Handgun weapon
    case IDX_CURR_HANDGUN_WEAPON_ITEMS: {
        if (_item == "") then {
            GVAR(center) removeHandgunItem ((GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS) select _itemIndex);
        } else {
            // Don't add item if it isn't a different item than what the unit already has
            if (_item != ((GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS) select _itemIndex)) then {
                GVAR(center) addWeaponItem [handgunWeapon GVAR(center), _item, true];
            };
        };

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_HANDGUN_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Binoculars
    case IDX_CURR_BINO_ITEMS: {
        if (_item == "") then {
            GVAR(center) removeBinocularItem ((GVAR(currentItems) select IDX_CURR_BINO_ITEMS) select _itemIndex);
        } else {
            // Don't add item if it isn't a different item than what the unit already has
            if (_item != ((GVAR(currentItems) select IDX_CURR_BINO_ITEMS) select _itemIndex)) then {
                GVAR(center) addWeaponItem [binocular GVAR(center), _item, true];
            };
        };

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_BINO) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_BINO_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
};

// Update weight display
(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", GVAR(center) call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);
