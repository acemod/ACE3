#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Handles selection changes on the left panel.
 *
 * Arguments:
 * 0: Left panel control <CONTROL>
 * 1: Left panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_curSel"];

if (_curSel < 0) exitWith {};

private _display = ctrlParent _control;
private _item = [_control lbData _curSel, _control lnbData [_curSel, 0]] select (ctrlType _control == CT_LISTNBOX);

// When having chosen a new category, see if the current right panel can be kept open, otherwise take default
private _currentRightPanel = _display displayCtrl GVAR(currentRightPanel);
private _selectCorrectPanelWeapon = [_display displayCtrl IDC_buttonOptic, _currentRightPanel] select (!isNil QGVAR(currentRightPanel) && {GVAR(currentRightPanel) in [RIGHT_PANEL_ACC_IDCS, IDC_buttonCurrentMag, IDC_buttonCurrentMag2]});
private _selectCorrectPanelContainer = [_display displayCtrl IDC_buttonMisc, _currentRightPanel] select (!isNil QGVAR(currentRightPanel) && {GVAR(currentRightPanel) in [RIGHT_PANEL_ITEMS_IDCS]});

// Remove all magazines from the current weapon that aren't compatible with the new weapon
private _fnc_clearCurrentWeaponMags = {
    private _compatibleMagsCurrentWeapon = compatibleMagazines _currentWeapon;

    // If nothing was selected, remove all magazines from the current weapon
    if (_item != "") then {
        //IGNORE_PRIVATE_WARNING ["_compatibleMags"];
        _compatibleMagsCurrentWeapon = _compatibleMagsCurrentWeapon - _compatibleMags;
    };

    {
        GVAR(center) removeMagazines _x;
    } forEach _compatibleMagsCurrentWeapon;

    // Update currentItems
    private _loadout = getUnitLoadout GVAR(center);

    GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, (_loadout select IDX_LOADOUT_UNIFORM) param [1, []]];
    GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, (_loadout select IDX_LOADOUT_VEST) param [1, []]];
    GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, (_loadout select IDX_LOADOUT_BACKPACK) param [1, []]];
};

// Check which right panel has changed
switch (GVAR(currentLeftPanel)) do {
    // Primary weapon
    case IDC_buttonPrimaryWeapon: {
        private _currentWeapon = GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON;

        // If nothing selected, remove primary weapon and its magazines
        if (_item == "") then {
            call _fnc_clearCurrentWeaponMags;

            GVAR(center) removeWeapon (primaryWeapon GVAR(center));
            GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON_ITEMS, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            // Check if a new primary weapon was selected
            if (_item != _currentWeapon) then {
                // Get magazines that are compatible with the new weapon
                private _compatibleMags = compatibleMagazines _item;

                // Remove all magazines from the current weapon that aren't compatible with the new one
                call _fnc_clearCurrentWeaponMags;

                // Add new weapon without taking a magazine from the inventory
                [GVAR(center), _item] call EFUNC(common,addWeapon);

                private _linkedItems = primaryWeaponItems GVAR(center) - [""];

                // Remove linked items if unavailable
                if (_linkedItems isNotEqualTo []) then {
                    {
                        if !(_x in GVAR(virtualItemsFlat)) then {
                            GVAR(center) removePrimaryWeaponItem _x;
                        };
                    } forEach _linkedItems;
                };

                // Add old attachments and magazines back if they are compatible
                {
                    if (_item canAdd _x) then {
                        GVAR(center) addWeaponItem [_item, _x, true];
                    };
                } forEach (GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS);

                (getUnitLoadout GVAR(center) select IDX_LOADOUT_PRIMARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];

                _primaryMagazine = _primaryMagazine param [0, ""];

                // Add a magazine to the primary muzzle if empty
                if (_primaryMagazine == "") then {
                    // Get magazines that are compatible with the new weapon's primary muzzle only
                    private _compatibleMagsPrimaryMuzzle = compatibleMagazines [_item, "this"];
                    private _compatibleMagIndex = _compatibleMagsPrimaryMuzzle findAny (keys (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL));

                    if (_compatibleMagIndex != -1) then {
                        _primaryMagazine = _compatibleMagsPrimaryMuzzle select _compatibleMagIndex;
                        GVAR(center) addWeaponItem [_item, _primaryMagazine, true];
                    };
                };

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine, _secondaryMagazine param [0, ""]]];
                GVAR(currentItems) set [IDX_CURR_PRIMARY_WEAPON, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON

            [_display, _selectCorrectPanelWeapon, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelWeapon}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Handgun weapon
    case IDC_buttonHandgun: {
        private _currentWeapon = GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON;

        // If nothing selected, remove handgun weapon and its magazines
        if (_item == "") then {
            call _fnc_clearCurrentWeaponMags;

            GVAR(center) removeWeapon (handgunWeapon GVAR(center));
            GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON_ITEMS, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            // Check if a new handgun weapon was selected
            if (_item != _currentWeapon) then {
                // Get magazines that are compatible with the new weapon
                private _compatibleMags = compatibleMagazines _item;

                // Remove all magazines from the current weapon that aren't compatible with the new one
                call _fnc_clearCurrentWeaponMags;

                // Add new weapon without taking a magazine from the inventory
                [GVAR(center), _item] call EFUNC(common,addWeapon);

                private _linkedItems = handgunItems GVAR(center) - [""];

                // Remove linked items if unavailable
                if (_linkedItems isNotEqualTo []) then {
                    {
                        if !(_x in GVAR(virtualItemsFlat)) then {
                            GVAR(center) removeHandgunItem _x;
                        };
                    } forEach _linkedItems;
                };

                // Add old attachments and magazines back if they are compatible
                {

                    if (_item canAdd _x) then {
                        GVAR(center) addWeaponItem [_item, _x, true];
                    };
                } forEach (GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS);

                (getUnitLoadout GVAR(center) select IDX_LOADOUT_HANDGUN_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];

                _primaryMagazine = _primaryMagazine param [0, ""];

                // Add a magazine to the primary muzzle if empty
                if (_primaryMagazine == "") then {
                    // Get magazines that are compatible with the new weapon's primary muzzle only
                    private _compatibleMagsPrimaryMuzzle = compatibleMagazines [_item, "this"];
                    private _compatibleMagIndex = _compatibleMagsPrimaryMuzzle findAny (keys (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL));

                    if (_compatibleMagIndex != -1) then {
                        _primaryMagazine = _compatibleMagsPrimaryMuzzle select _compatibleMagIndex;
                        GVAR(center) addWeaponItem [_item, _primaryMagazine, true];
                    };
                };

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine, _secondaryMagazine param [0, ""]]];
                GVAR(currentItems) set [IDX_CURR_HANDGUN_WEAPON, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON

            [_display, _selectCorrectPanelWeapon, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelWeapon}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Secondary weapon
    case IDC_buttonSecondaryWeapon: {
        private _currentWeapon = GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON;
        private _isDisposable = _item in (uiNamespace getVariable QGVAR(CBAdisposableLaunchers));

        // If nothing selected, remove secondary weapon and its magazines
        if (_item == "") then {
            call _fnc_clearCurrentWeaponMags;

            GVAR(center) removeWeapon (secondaryWeapon GVAR(center));
            GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON_ITEMS, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            // Check if a new secondary weapon was selected
            if (_item != _currentWeapon) then {
                // Get magazines that are compatible with the new weapon
                private _compatibleMags = compatibleMagazines _item;

                // Remove all magazines from the current weapon that aren't compatible with the new one
                call _fnc_clearCurrentWeaponMags;

                // Add new weapon without taking a magazine from the inventory
                [GVAR(center), _item] call EFUNC(common,addWeapon);

                private _linkedItems = secondaryWeaponItems GVAR(center) - [""];

                // Remove linked items if unavailable
                if (_linkedItems isNotEqualTo []) then {
                    {
                        if !(_x in GVAR(virtualItemsFlat)) then {
                            GVAR(center) removeSecondaryWeaponItem _x;
                        };
                    } forEach _linkedItems;
                };

                // Add old attachments and magazines back if they are compatible
                {
                    if (_item canAdd _x) then {
                        GVAR(center) addWeaponItem [_item, _x, true];
                    };
                } forEach (GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS);

                (getUnitLoadout GVAR(center) select IDX_LOADOUT_SECONDARY_WEAPON) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];

                _primaryMagazine = _primaryMagazine param [0, ""];

                // Add a magazine to the primary muzzle if empty
                if (_primaryMagazine == "") then {
                    // Get magazines that are compatible with the new weapon's primary muzzle only
                    private _compatibleMagsPrimaryMuzzle = compatibleMagazines [_item, "this"];
                    private _compatibleMagIndex = _compatibleMagsPrimaryMuzzle findAny (keys (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL));

                    if (_compatibleMagIndex != -1) then {
                        _primaryMagazine = _compatibleMagsPrimaryMuzzle select _compatibleMagIndex;
                        GVAR(center) addWeaponItem [_item, _primaryMagazine, true];
                    };
                };

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine, _secondaryMagazine param [0, ""]]];
                GVAR(currentItems) set [IDX_CURR_SECONDARY_WEAPON, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON

            // If item is a disposable launcher, delay a bit to show new compatible items
            if (_isDisposable) then {
                [{
                    _this call FUNC(fillRightPanel);
                }, [_display, _selectCorrectPanelWeapon]] call CBA_fnc_execNextFrame;
            } else {
                [_display, _selectCorrectPanelWeapon, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelWeapon}] call FUNC(fillRightPanel);
            };
        };

        // If item is a disposable launcher, delay a bit to show new compatible items
        if (_isDisposable) then {
            [{
                // Make unit switch to new item
                call FUNC(showItem);

                // Display new items's info on the bottom right
                _this call FUNC(itemInfo);
            }, [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item]] call CBA_fnc_execNextFrame;
        } else {
            // Make unit switch to new item
            call FUNC(showItem);

            // Display new items's info on the bottom right
            [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
        };
    };
    // Headgear
    case IDC_buttonHeadgear: {
        if (_item == "") then {
            removeHeadgear GVAR(center);
            GVAR(currentItems) set [IDX_CURR_HEADGEAR, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_HEADGEAR) != _item) then {
                GVAR(center) addHeadgear _item;
                GVAR(currentItems) set [IDX_CURR_HEADGEAR, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Uniform
    case IDC_buttonUniform: {
        if (_item == "") then {
            removeUniform GVAR(center);

            GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, []];
            GVAR(currentItems) set [IDX_CURR_UNIFORM, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_UNIFORM) != _item) then {
                // Get the unit's current loadout and just change the container
                private _loadout = getUnitLoadout GVAR(center);
                _loadout set [IDX_LOADOUT_UNIFORM, [_item, GVAR(currentItems) select IDX_CURR_UNIFORM_ITEMS]];
                GVAR(center) setUnitLoadout _loadout;

                private _uniformItems = uniformItems GVAR(center);
                private _index = count _uniformItems - 1;

                // Remove any items that can't fit in the container (this prevents overloading)
                while {loadUniform GVAR(center) > 1 && {_index >= 0}} do {
                    GVAR(center) removeItemFromUniform (_uniformItems select _index);
                    DEC(_index);
                };

                GVAR(currentItems) set [IDX_CURR_UNIFORM, _item];

                [GVAR(center), ""] call BIS_fnc_setUnitInsignia;
                [GVAR(center), GVAR(currentInsignia)] call BIS_fnc_setUnitInsignia;
            };

            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelContainer}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Vest
    case IDC_buttonVest: {
        if (_item == "") then {
            removeVest GVAR(center);
            GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, []];
            GVAR(currentItems) set [IDX_CURR_VEST, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_VEST) != _item) then {
                // Get the unit's current loadout and just change the container
                private _loadout = getUnitLoadout GVAR(center);
                _loadout set [IDX_LOADOUT_VEST, [_item, GVAR(currentItems) select IDX_CURR_VEST_ITEMS]];
                GVAR(center) setUnitLoadout _loadout;

                private _vestItems = vestItems GVAR(center);
                private _index = count _vestItems - 1;

                // Remove any items that can't fit in the container (this prevents overloading)
                while {loadVest GVAR(center) > 1 && {_index >= 0}} do {
                    GVAR(center) removeItemFromVest (_vestItems select _index);
                    DEC(_index);
                };

                GVAR(currentItems) set [IDX_CURR_VEST, _item];

                [GVAR(center), ""] call BIS_fnc_setUnitInsignia;
                [GVAR(center), GVAR(currentInsignia)] call BIS_fnc_setUnitInsignia;
            };

            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelContainer}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Backpack
    case IDC_buttonBackpack: {
        if (_item == "") then {
            removeBackpack GVAR(center);
            GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, []];
            GVAR(currentItems) set [IDX_CURR_BACKPACK, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_BACKPACK) != _item) then {
                // Get the unit's current loadout and just change the container
                private _loadout = getUnitLoadout GVAR(center);
                _loadout set [IDX_LOADOUT_BACKPACK, [_item, GVAR(currentItems) select IDX_CURR_BACKPACK_ITEMS]];
                GVAR(center) setUnitLoadout _loadout;

                private _backpackItems = backpackItems GVAR(center);
                private _index = count _backpackItems - 1;

                // Remove any items that can't fit in the container (this prevents overloading)
                while {loadBackpack GVAR(center) > 1 && {_index >= 0}} do {
                    GVAR(center) removeItemFromBackpack (_backpackItems select _index);
                    DEC(_index);
                };

                GVAR(currentItems) set [IDX_CURR_BACKPACK, _item];

                [GVAR(center), ""] call BIS_fnc_setUnitInsignia;
                [GVAR(center), GVAR(currentInsignia)] call BIS_fnc_setUnitInsignia;
            };

            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelContainer}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgVehicles" >> _item] call FUNC(itemInfo);
    };
    // Facewear
    case IDC_buttonGoggles: {
        if (_item == "") then {
            removeGoggles GVAR(center);
            GVAR(currentItems) set [IDX_CURR_GOGGLES, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_GOGGLES) != _item) then {
                GVAR(center) addGoggles _item;
                GVAR(currentItems) set [IDX_CURR_GOGGLES, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgGlasses" >> _item] call FUNC(itemInfo);
    };
    // NVG
    case IDC_buttonNVG: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_NVG);
            GVAR(currentItems) set [IDX_CURR_NVG, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_NVG) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_NVG, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Binoculars
    case IDC_buttonBinoculars: {
        private _currentWeapon = GVAR(currentItems) select IDX_CURR_BINO;

        // If nothing selected, remove secondary weapon and its magazines
        if (_item == "") then {
            call _fnc_clearCurrentWeaponMags;

            GVAR(center) removeWeapon (binocular GVAR(center));
            GVAR(currentItems) set [IDX_CURR_BINO_ITEMS, ["", "", "", "", "", ""]];
            GVAR(currentItems) set [IDX_CURR_BINO, ""];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            // Check if a new binocular was selected
            if (_item != _currentWeapon) then {
                // Get magazines that are compatible with the new binocular
                private _compatibleMags = compatibleMagazines _item;

                // Remove all magazines from the current binocular that aren't compatible with the new one
                call _fnc_clearCurrentWeaponMags;

                // Add new weapon without taking a magazine from the inventory
                [GVAR(center), _item] call EFUNC(common,addWeapon);

                private _linkedItems = binocularItems GVAR(center) - [""];

                // Remove linked items if unavailable
                if (_linkedItems isNotEqualTo []) then {
                    {
                        if !(_x in GVAR(virtualItemsFlat)) then {
                            GVAR(center) removeBinocularItem _x;
                        };
                    } forEach _linkedItems;
                };

                // Add old attachments and magazines back if they are compatible
                {
                    if (_item canAdd _x) then {
                        GVAR(center) addWeaponItem [_item, _x, true];
                    };
                } forEach (GVAR(currentItems) select IDX_CURR_BINO_ITEMS);

                (getUnitLoadout GVAR(center) select IDX_LOADOUT_BINO) params ["", "_muzzle", "_flashlight", "_optics", "_primaryMagazine", "_secondaryMagazine", "_bipod"];

                _primaryMagazine = _primaryMagazine param [0, ""];

                // Add a magazine to the primary muzzle if empty
                if (_primaryMagazine == "") then {
                    // Get magazines that are compatible with the new weapon's primary muzzle only
                    private _compatibleMagsPrimaryMuzzle = compatibleMagazines [_item, "this"];
                    private _compatibleMagIndex = _compatibleMagsPrimaryMuzzle findAny (keys (GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL));

                    if (_compatibleMagIndex != -1) then {
                        _primaryMagazine = _compatibleMagsPrimaryMuzzle select _compatibleMagIndex;
                        GVAR(center) addWeaponItem [_item, _primaryMagazine, true];
                    };
                };

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_BINO_ITEMS, [_muzzle, _flashlight, _optics, _bipod, _primaryMagazine, _secondaryMagazine param [0, ""]]];
                GVAR(currentItems) set [IDX_CURR_BINO, _item];
            };

            TOGGLE_RIGHT_PANEL_WEAPON

            [_display, _selectCorrectPanelWeapon, !GVAR(refreshing) && {_currentRightPanel isNotEqualTo _selectCorrectPanelWeapon}] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Map
    case IDC_buttonMap: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_MAP);
            GVAR(currentItems) set [IDX_CURR_MAP, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_MAP) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_MAP, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Compass
    case IDC_buttonCompass: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_COMPASS);
            GVAR(currentItems) set [IDX_CURR_COMPASS, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_COMPASS) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_COMPASS, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Radio
    case IDC_buttonRadio: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_RADIO);
            GVAR(currentItems) set [IDX_CURR_RADIO, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_RADIO) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_RADIO, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Watch
    case IDC_buttonWatch: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_WATCH);
            GVAR(currentItems) set [IDX_CURR_WATCH, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_WATCH) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_WATCH, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // GPS or UAV Terminal
    case IDC_buttonGPS: {
        if (_item == "") then {
            GVAR(center) unlinkItem (GVAR(currentItems) select IDX_CURR_COMMS);
            GVAR(currentItems) set [IDX_CURR_COMMS, ""];
        } else {
            if ((GVAR(currentItems) select IDX_CURR_COMMS) != _item) then {
                GVAR(center) linkItem _item;
                GVAR(currentItems) set [IDX_CURR_COMMS, _item];
            };
        };

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    // Face
    case IDC_buttonFace: {
        private _face = [_item, "Default"] select (_item == "");

        GVAR(center) setFace _face;
        GVAR(currentFace) = _face;

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        [_display, _control, _curSel, configFile >> "CfgFaces" >> _item] call FUNC(itemInfo);
    };
    // Voice
    case IDC_buttonVoice: {
        GVAR(center) setSpeaker _item;
        GVAR(currentVoice) = _item;

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Display new items's info on the bottom right
        [_display, _control, _curSel, configFile >> "CfgVoice" >> _item] call FUNC(itemInfo);
    };
    // Insignia
    case IDC_buttonInsignia: {
        [GVAR(center), _item] call BIS_fnc_setUnitInsignia;
        GVAR(currentInsignia) = _item;

        // Make unit switch to new item
        call FUNC(showItem);

        TOGGLE_RIGHT_PANEL_HIDE

        // Check for correct config: First mission, then campaign and finally regular config
        private _itemCfg = missionConfigFile >> "CfgUnitInsignia" >> _item;

        if (isNull _itemCfg) then {
            _itemCfg = campaignConfigFile >> "CfgUnitInsignia" >> _item;
        };

        if (isNull _itemCfg) then {
            _itemCfg = configFile >> "CfgUnitInsignia" >> _item;
        };

        // Display new items's info on the bottom right
        [_display, _control, _curSel, _itemCfg] call FUNC(itemInfo);
    };
};

(_display displayCtrl IDC_totalWeightText) ctrlSetText (format ["%1 (%2)", GVAR(center) call EFUNC(common,getWeight), [GVAR(center), 1] call EFUNC(common,getWeight)]);
