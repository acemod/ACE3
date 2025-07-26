#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles selection changes on the left panel tree control.
 *
 * Arguments:
 * 0: Tree control <CONTROL>
 * 1: Tree selection path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control, [0, 2]] call ace_arsenal_fnc_onTreeSelChanged
 *
 * Public: No
 */

params ["_control", "_selectionPath"];

// Exit if no selection
if (count _selectionPath == 0) exitWith {};

private _display = ctrlParent _control;
private _item = _control tvData _selectionPath;

// Ignore group nodes (but not empty entry)
if (_item find "GROUP_" == 0) exitWith {};

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
        [_display, _control, _selectionPath, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };
    
    // Uniform
    case IDC_buttonUniform: {
        // Copy old uniform content before changing
        GVAR(center) setVariable [QGVAR(previousUniformContainer), uniformContainer GVAR(center)];

        if (_item == "") then {
            removeUniform GVAR(center);

            GVAR(currentItems) set [IDX_CURR_UNIFORM, ""];
            GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, []];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_UNIFORM) != _item) then {
                // Get container content
                private _itemsUniform = itemsWithMagazines uniformContainer GVAR(center);

                // Remove uniform
                removeUniform GVAR(center);

                // Add uniform
                GVAR(center) forceAddUniform _item;

                // Add container content back
                private _uniformContainer = uniformContainer GVAR(center);

                // Items to add
                private _itemsToAdd = _itemsUniform select {_x in GVAR(virtualItemsFlat)};

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, _itemsToAdd];

                // Add old items back
                {
                    if (_uniformContainer canAdd [_x, 1]) then {
                        _uniformContainer addItemCargoGlobal [_x, 1];
                    } else {
                        // Save items that don't fit in container
                        GVAR(center) setVariable [QGVAR(droppedItems), ((GVAR(center) getVariable [QGVAR(droppedItems), []]) + [_x]), true];

                        // Try to add to any other container
                        private _containerAdded = false;

                        private _currentItem = _x;
                        {
                            if (_x canAdd [_currentItem, 1]) exitWith {
                                _x addItemCargoGlobal [_currentItem, 1];
                                _containerAdded = true;
                            };
                        } forEach [vestContainer GVAR(center), backpackContainer GVAR(center)];

                        // Display message if we have to drop item
                        if (!_containerAdded) then {
                            [LLSTRING(DroppedItem)] call EFUNC(common,displayTextStructured);
                        };
                    };
                } forEach _itemsToAdd;

                GVAR(currentItems) set [IDX_CURR_UNIFORM, _item];
            };

            // Display new container content in right panel
            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _selectionPath, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };

    // Vest
    case IDC_buttonVest: {
        // Copy old vest content before changing
        GVAR(center) setVariable [QGVAR(previousVestContainer), vestContainer GVAR(center)];

        if (_item == "") then {
            removeVest GVAR(center);

            GVAR(currentItems) set [IDX_CURR_VEST, ""];
            GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, []];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_VEST) != _item) then {
                // Get container content
                private _itemsVest = itemsWithMagazines vestContainer GVAR(center);

                // Remove vest
                removeVest GVAR(center);

                // Add vest
                GVAR(center) addVest _item;

                // Add container content back
                private _vestContainer = vestContainer GVAR(center);

                // Items to add
                private _itemsToAdd = _itemsVest select {_x in GVAR(virtualItemsFlat)};

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, _itemsToAdd];

                // Add old items back
                {
                    if (_vestContainer canAdd [_x, 1]) then {
                        _vestContainer addItemCargoGlobal [_x, 1];
                    } else {
                        // Save items that don't fit in container
                        GVAR(center) setVariable [QGVAR(droppedItems), ((GVAR(center) getVariable [QGVAR(droppedItems), []]) + [_x]), true];

                        // Try to add to any other container
                        private _containerAdded = false;

                        private _currentItem = _x;
                        {
                            if (_x canAdd [_currentItem, 1]) exitWith {
                                _x addItemCargoGlobal [_currentItem, 1];
                                _containerAdded = true;
                            };
                        } forEach [uniformContainer GVAR(center), backpackContainer GVAR(center)];

                        // Display message if we have to drop item
                        if (!_containerAdded) then {
                            [LLSTRING(DroppedItem)] call EFUNC(common,displayTextStructured);
                        };
                    };
                } forEach _itemsToAdd;

                GVAR(currentItems) set [IDX_CURR_VEST, _item];
            };

            // Display new container content in right panel
            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _selectionPath, configFile >> "CfgWeapons" >> _item] call FUNC(itemInfo);
    };

    // Backpack
    case IDC_buttonBackpack: {
        // Copy old backpack content before changing
        GVAR(center) setVariable [QGVAR(previousBackpackContainer), backpackContainer GVAR(center)];

        if (_item == "") then {
            removeBackpack GVAR(center);

            GVAR(currentItems) set [IDX_CURR_BACKPACK, ""];
            GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, []];

            TOGGLE_RIGHT_PANEL_HIDE
        } else {
            if ((GVAR(currentItems) select IDX_CURR_BACKPACK) != _item) then {
                // Get container content
                private _itemsBackpack = itemsWithMagazines backpackContainer GVAR(center);

                // Remove backpack
                removeBackpack GVAR(center);

                // Add backpack
                GVAR(center) addBackpack _item;

                // Add container content back
                private _backpackContainer = backpackContainer GVAR(center);

                // Items to add
                private _itemsToAdd = _itemsBackpack select {_x in GVAR(virtualItemsFlat)};

                // Update currentItems
                GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, _itemsToAdd];

                // Add old items back
                {
                    if (_backpackContainer canAdd [_x, 1]) then {
                        _backpackContainer addItemCargoGlobal [_x, 1];
                    } else {
                        // Save items that don't fit in container
                        GVAR(center) setVariable [QGVAR(droppedItems), ((GVAR(center) getVariable [QGVAR(droppedItems), []]) + [_x]), true];

                        // Try to add to any other container
                        private _containerAdded = false;

                        private _currentItem = _x;
                        {
                            if (_x canAdd [_currentItem, 1]) exitWith {
                                _x addItemCargoGlobal [_currentItem, 1];
                                _containerAdded = true;
                            };
                        } forEach [uniformContainer GVAR(center), vestContainer GVAR(center)];

                        // Display message if we have to drop item
                        if (!_containerAdded) then {
                            [LLSTRING(DroppedItem)] call EFUNC(common,displayTextStructured);
                        };
                    };
                } forEach _itemsToAdd;

                GVAR(currentItems) set [IDX_CURR_BACKPACK, _item];
            };

            // Display new container content in right panel
            TOGGLE_RIGHT_PANEL_CONTAINER

            [_display, _selectCorrectPanelContainer] call FUNC(fillRightPanel);
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Display new items's info on the bottom right
        [_display, _control, _selectionPath, configFile >> "CfgVehicles" >> _item] call FUNC(itemInfo);
    };

    // For all other categories, just update the current item and show it
    default {
        // Update current item based on panel
        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonHeadgear: {GVAR(currentItems) set [IDX_CURR_HEADGEAR, _item]};
            case IDC_buttonGoggles: {GVAR(currentItems) set [IDX_CURR_GOGGLES, _item]};
            case IDC_buttonNVG: {GVAR(currentItems) set [IDX_CURR_NVG, _item]};
            case IDC_buttonBinoculars: {GVAR(currentItems) set [IDX_CURR_BINO, _item]};
            case IDC_buttonMap: {GVAR(currentItems) set [IDX_CURR_MAP, _item]};
            case IDC_buttonCompass: {GVAR(currentItems) set [IDX_CURR_COMPASS, _item]};
            case IDC_buttonRadio: {GVAR(currentItems) set [IDX_CURR_RADIO, _item]};
            case IDC_buttonWatch: {GVAR(currentItems) set [IDX_CURR_WATCH, _item]};
            case IDC_buttonFace: {GVAR(currentFace) = _item};
            case IDC_buttonVoice: {GVAR(currentVoice) = _item};
            case IDC_buttonInsignia: {GVAR(currentInsignia) = _item};
        };

        // Make unit switch to new item
        call FUNC(showItem);

        // Determine config type based on panel
        private _configClass = switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonGoggles: {"CfgGlasses"};
            case IDC_buttonFace: {"CfgFaces"};
            case IDC_buttonVoice: {"CfgVoice"};
            case IDC_buttonInsignia: {"CfgUnitInsignia"};
            default {"CfgWeapons"};
        };

        // Display new items's info on the bottom right
        [_display, _control, _selectionPath, configFile >> _configClass >> _item] call FUNC(itemInfo);
    };
};