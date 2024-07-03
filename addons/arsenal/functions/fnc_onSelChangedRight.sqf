#include "..\script_component.hpp"
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
        private _currentItemInSlot = (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS) select _itemIndex;
        // If removal
        if (_item == "") then {
            private _secondaryMagazine = (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS) select 5;

            // If secondary magazine, make sure to remove from correct muzzle
            if (_itemIndex == 5 && {_secondaryMagazine != ""} && {((GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS) select 4) == _secondaryMagazine}) then {
                // Remove both magazines
                GVAR(center) removePrimaryWeaponItem _secondaryMagazine;
                GVAR(center) removePrimaryWeaponItem _secondaryMagazine;

                // Add magazine back into primary muzzle
                GVAR(center) addWeaponItem [primaryWeapon GVAR(center), _secondaryMagazine, true];
            } else {
                GVAR(center) removePrimaryWeaponItem _currentItemInSlot;
            };
        } else {
            // Don't add item if it isn't a magazine or a different item than what the unit already has
            if (_itemIndex >= 4 || {_item != _currentItemInSlot}) then {
                // If magazine, make sure to add to correct muzzle
                if (_itemIndex >= 4) then {
                    private _weapon = primaryWeapon GVAR(center);

                    GVAR(center) addWeaponItem [_weapon, [_item, nil, (_weapon call CBA_fnc_getMuzzles) param [_itemIndex - 4, ""]], true];
                } else {
                    GVAR(center) addWeaponItem [primaryWeapon GVAR(center), _item, true];
                };
            };
        };

        // Call event for compatibility
        [QGVAR(weaponItemChanged), [primaryWeapon GVAR(center), _item, _itemIndex]] call CBA_fnc_localEvent;

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_PRIMARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Secondary weapon
    case IDX_CURR_SECONDARY_WEAPON_ITEMS: {
        private _currentItemInSlot = (GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS) select _itemIndex;
        private _isDisposable = CBA_disposable_replaceDisposableLauncher && {!isNil "CBA_disposable_loadedLaunchers"} &&
            {
                if (CBA_disposable_loadedLaunchers isEqualType createHashMap) then { // after CBA 3.18
                    (secondaryWeapon GVAR(center)) in CBA_disposable_loadedLaunchers
                } else {
                    !isNil {CBA_disposable_loadedLaunchers getVariable (secondaryWeapon player)}
                }
            };

        // If removal
        if (_item == "") then {
            // Don't unload magazines from diposable weapons
            if (_isDisposable && {_itemIndex >= 4}) exitWith {
                TRACE_1("Ignoring unload of magazine from disposable",secondaryWeapon GVAR(center));
            };

            private _secondaryMagazine = (GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS) select 5;

            // If secondary magazine, make sure to remove from correct muzzle
            if (_itemIndex == 5 && {_secondaryMagazine != ""} && {((GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS) select 4) == _secondaryMagazine}) then {
                // Remove both magazines
                GVAR(center) removeSecondaryWeaponItem _secondaryMagazine;
                GVAR(center) removeSecondaryWeaponItem _secondaryMagazine;

                // Add magazine back into primary muzzle
                GVAR(center) addWeaponItem [secondaryWeapon GVAR(center), _secondaryMagazine, true];
            } else {
                GVAR(center) removeSecondaryWeaponItem _currentItemInSlot;
            };
        } else {
            // Don't add item if it isn't a magazine or a different item than what the unit already has
            if (_itemIndex >= 4 || {_item != _currentItemInSlot}) then {
                // If magazine, make sure to add to correct muzzle
                if (_itemIndex >= 4) then {
                    private _weapon = secondaryWeapon GVAR(center);

                    GVAR(center) addWeaponItem [_weapon, [_item, nil, (_weapon call CBA_fnc_getMuzzles) param [_itemIndex - 4, ""]], true];
                } else {
                    GVAR(center) addWeaponItem [secondaryWeapon GVAR(center), _item, true];
                };
            };
        };

        // Call event for compatibility
        [QGVAR(weaponItemChanged), [secondaryWeapon GVAR(center), _item, _itemIndex]] call CBA_fnc_localEvent;

        // Update currentItems
        if !(_isDisposable && {_itemIndex >= 4}) then {
            (getUnitLoadout GVAR(center) select IDX_LOADOUT_SECONDARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
            GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];
        };

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Handgun weapon
    case IDX_CURR_HANDGUN_WEAPON_ITEMS: {
        private _currentItemInSlot = (GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS) select _itemIndex;
        if (_item == "") then {
            private _secondaryMagazine = (GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS) select 5;

            // If secondary magazine, make sure to remove from correct muzzle
            if (_itemIndex == 5 && {_secondaryMagazine != ""} && {((GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS) select 4) == _secondaryMagazine}) then {
                // Remove both magazines
                GVAR(center) removeHandgunItem _secondaryMagazine;
                GVAR(center) removeHandgunItem _secondaryMagazine;

                // Add magazine back into primary muzzle
                GVAR(center) addWeaponItem [handgunWeapon GVAR(center), _secondaryMagazine, true];
            } else {
                GVAR(center) removeHandgunItem _currentItemInSlot;
            };
        } else {
            // Don't add item if it isn't a magazine or a different item than what the unit already has
            if (_itemIndex >= 4 || {_item != _currentItemInSlot}) then {
                // If magazine, make sure to add to correct muzzle
                if (_itemIndex >= 4) then {
                    private _weapon = handgunWeapon GVAR(center);

                    GVAR(center) addWeaponItem [_weapon, [_item, nil, (_weapon call CBA_fnc_getMuzzles) param [_itemIndex - 4, ""]], true];
                } else {
                    GVAR(center) addWeaponItem [handgunWeapon GVAR(center), _item, true];
                };
            };
        };

        // Call event for compatibility
        [QGVAR(weaponItemChanged), [handgunWeapon GVAR(center), _item, _itemIndex]] call CBA_fnc_localEvent;

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_HANDGUN_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
    // Binoculars
    case IDX_CURR_BINO_ITEMS: {
        private _currentItemInSlot = (GVAR(currentItems) select IDX_CURR_BINO_ITEMS) select _itemIndex;
        if (_item == "") then {
            private _secondaryMagazine = (GVAR(currentItems) select IDX_CURR_BINO_ITEMS) select 5;

            // If secondary magazine, make sure to remove from correct muzzle
            if (_itemIndex == 5 && {_secondaryMagazine != ""} && {((GVAR(currentItems) select IDX_CURR_BINO_ITEMS) select 4) == _secondaryMagazine}) then {
                // Remove both magazines
                GVAR(center) removeBinocularItem _secondaryMagazine;
                GVAR(center) removeBinocularItem _secondaryMagazine;

                // Add magazine back into primary muzzle
                GVAR(center) addWeaponItem [binocular GVAR(center), _secondaryMagazine, true];
            } else {
                GVAR(center) removeBinocularItem _currentItemInSlot;
            };
        } else {
            // Don't add item if it isn't a magazine or a different item than what the unit already has
            if (_itemIndex >= 4 || {_item != _currentItemInSlot}) then {
                // If magazine, make sure to add to correct muzzle
                if (_itemIndex >= 4) then {
                    private _weapon = binocular GVAR(center);

                    GVAR(center) addWeaponItem [_weapon, [_item, nil, (_weapon call CBA_fnc_getMuzzles) param [_itemIndex - 4, ""]], true];
                } else {
                    GVAR(center) addWeaponItem [binocular GVAR(center), _item, true];
                };
            };
        };

        // Call event for compatibility
        [QGVAR(weaponItemChanged), [binocular GVAR(center), _item, _itemIndex]] call CBA_fnc_localEvent;

        // Update currentItems
        (getUnitLoadout GVAR(center) select IDX_LOADOUT_BINO) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];
        GVAR(currentItems) set [IDX_CURR_BINO_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine param [0, ""], _secondaryMagazine param [0, ""]]];

        [_display, _control, _curSel, configFile >> ["CfgWeapons", "CfgMagazines"] select (_itemIndex >= 4) >> _item] call FUNC(itemInfo);
    };
};

// Update weight display
(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", GVAR(center) call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);
