#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Fills right panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

// Fade old control background
if (!isNil QGVAR(currentRightPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentRightPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit FADE_DELAY;
};

// Show new control background
private _ctrlIDC = ctrlIDC _control;
private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
_ctrlBackground ctrlShow true;
_ctrlBackground ctrlSetFade 0;
_ctrlBackground ctrlCommit FADE_DELAY;

private _searchbarCtrl = _display displayCtrl IDC_rightSearchbar;

// Show right search bar
if (!(ctrlShown _searchbarCtrl) || {ctrlFade _searchbarCtrl > 0}) then {
    _searchbarCtrl ctrlShow true;
    _searchbarCtrl ctrlSetFade 0;
    _searchbarCtrl ctrlCommit 0;
};

private _fnc_fill_right_Container = {
    params ["_configCategory", "_className", "_isMagazine", ["_isUnique", false, [false]]];

    // If item is not in the arsenal, it must be unique
    if (!_isUnique && {!(_className in GVAR(virtualItemsFlat))}) then {
        _isUnique = true;
    };

    // If not in cache, find info and cache it for later use
    private _cachedItemInfo = GVAR(rightPanelCache) getOrDefaultCall [_configCategory + _className, {
        // Get display name, picture and mass
        private _configPath = configFile >> _configCategory >> _className;

        [getText (_configPath >> "displayName"), getText (_configPath >> "picture"), if (_isMagazine) then {getNumber (_configPath >> "mass")} else {getNumber (_configPath >> "itemInfo" >> "mass")}]
    }, true];

    _cachedItemInfo params ["_displayName", "_picture", "_mass"];

    private _lbAdd = _ctrlPanel lnbAddRow ["", _displayName, "0"];

    _ctrlPanel lnbSetData [[_lbAdd, 0], _className];
    _ctrlPanel lnbSetPicture [[_lbAdd, 0], _picture];
    _ctrlPanel lnbSetValue [[_lbAdd, 0], _mass];
    _ctrlPanel lnbSetValue [[_lbAdd, 2], [0, 1] select _isUnique];
    _ctrlPanel lnbSetTooltip [[_lbAdd, 0], format ["%1\n%2", _displayName, _className]];
    _ctrlPanel setVariable [_className, _mass];
};

// Get all weapons on unit
private _weapons = [primaryWeapon GVAR(center), handgunWeapon GVAR(center), secondaryWeapon GVAR(center), binocular GVAR(center)];
private _compatibleMagazines = [];
private _muzzles = [];

// Get all compatibles magazines with unit's weapons
{

    _muzzles = _x call CBA_fnc_getMuzzles;

    // Get compatible magazines for primary & secondary muzzle (secondary muzzle is not guaranteed to exist)
    // Assumption: One weapon can have two muzzles maximum
    _compatibleMagazines pushBack [compatibleMagazines [_x, _muzzles param [0, ""]], compatibleMagazines [_x, _muzzles param [1, ""]]];
} forEach _weapons;

// This is used for the "compatible magazines" tab when a container is open
private _allCompatibleMags = [];

{
    _allCompatibleMags append (_x select 0);
    _allCompatibleMags append (_x select 1);
} forEach _compatibleMagazines;

private _ctrlPanel = _display displayCtrl IDC_rightTabContent;
private _listnBox = _display displayCtrl IDC_rightTabContentListnBox;

// Reset right panel content
lbClear _ctrlPanel;
lbClear _listnBox;

_ctrlPanel lbSetCurSel -1;
_listnBox lbSetCurSel -1;

// Retrieve compatible items
private _compatibleItems = [];
private _itemsToCheck = [];
private _compatibleMagsPrimaryMuzzle = [];
private _compatibleMagsSecondaryMuzzle = [];

switch (GVAR(currentLeftPanel)) do {
    // If weapons or binoculars are chosen, get their compatible magazines & items
    // Primary weapon
    case IDC_buttonPrimaryWeapon: {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 0 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 0 select 1;
        _compatibleItems = compatibleItems (_weapons select 0);
        _itemsToCheck = GVAR(currentItems) select IDX_CURR_PRIMARY_WEAPON_ITEMS;
    };
    // Handgun weapon
    case IDC_buttonHandgun: {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 1 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 1 select 1;
        _compatibleItems = compatibleItems (_weapons select 1);
        _itemsToCheck = GVAR(currentItems) select IDX_CURR_HANDGUN_WEAPON_ITEMS;
    };
    // Secondary weapon
    case IDC_buttonSecondaryWeapon: {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 2 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 2 select 1;
        _compatibleItems = compatibleItems (_weapons select 2);
        _itemsToCheck = GVAR(currentItems) select IDX_CURR_SECONDARY_WEAPON_ITEMS;
    };
    // Binoculars
    case IDC_buttonBinoculars: {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 3 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 3 select 1;
        _compatibleItems = compatibleItems (_weapons select 3);
        _itemsToCheck = GVAR(currentItems) select IDX_CURR_BINO_ITEMS;
    };
    // Uniform, vest or backpack
    case IDC_buttonUniform;
    case IDC_buttonVest;
    case IDC_buttonBackpack: {
        _ctrlPanel = _listnBox;
    };
};

// Force a "refresh" animation of the panel
_ctrlPanel ctrlSetFade 1;
_ctrlPanel ctrlCommit 0;
_ctrlPanel ctrlSetFade 0;
_ctrlPanel ctrlCommit FADE_DELAY;

// Check if the left panel is a weapon. If so, right panel will be compatible items with weapon only
private _leftPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon, IDC_buttonBinoculars];

// Add an empty entry if left panel is a weapon or bino
if (_leftPanelState && {_ctrlIDC in [RIGHT_PANEL_ACC_IDCS, IDC_buttonCurrentMag, IDC_buttonCurrentMag2]}) then {
    private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
    _ctrlPanel lbSetValue [_addEmpty, -1];
};

// Fill right panel according to category choice
switch (_ctrlIDC) do {
    // Optics
    case IDC_buttonOptic: {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS)) arrayIntersect _compatibleItems);
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS);

            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_OPTICS_ATTACHMENTS);
        };
    };
    // Flashlights
    case IDC_buttonItemAcc: {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS)) arrayIntersect _compatibleItems);
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS);

            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_FLASHLIGHT_ATTACHMENTS);
        };
    };
    // Muzzle attachments
    case IDC_buttonMuzzle: {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS)) arrayIntersect _compatibleItems);
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS);

            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_MUZZLE_ATTACHMENTS);
        };
    };
    // Bipods
    case IDC_buttonBipod: {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS)) arrayIntersect _compatibleItems);
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS);

            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_ATTACHMENTS) select IDX_VIRT_BIPOD_ATTACHMENTS);
        };
    };
    // Current primary muzzle compatible magazines
    case IDC_buttonCurrentMag: {
        if (_leftPanelState) then {
            {
                ["CfgMagazines", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL) arrayIntersect _compatibleMagsPrimaryMuzzle);
        };
    };
    // Current secondary muzzle compatible magazines
    case IDC_buttonCurrentMag2: {
        if (_leftPanelState) then {
            {
                ["CfgMagazines", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } forEach ((GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL) arrayIntersect _compatibleMagsSecondaryMuzzle);
        };
    };
    // All compatible magazines
    case IDC_buttonMag: {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL) arrayIntersect _allCompatibleMags);

        {
            ["CfgMagazines", _x, true, true] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL) arrayIntersect _allCompatibleMags);
    };
    // All magazines
    case IDC_buttonMagALL: {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_ITEMS_ALL);

        {
            ["CfgMagazines", _x, true, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_UNIQUE_VIRT_ITEMS_ALL);
    };
    // Grenades
    case IDC_buttonThrow: {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_GRENADES);

        {
            ["CfgMagazines", _x, true, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_UNIQUE_GRENADES);
    };
    // Explosives
    case IDC_buttonPut: {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_EXPLOSIVES);

        {
            ["CfgMagazines", _x, true, true] call _fnc_fill_right_Container;
        } forEach (GVAR(virtualItems) select IDX_VIRT_UNIQUE_EXPLOSIVES);
    };
    // Misc. items
    case IDC_buttonMisc: {
        // Don't add items that will be in a custom right panel button
        private _items = [];

        if (!isNil QGVAR(customRightPanelButtons)) then {
            {
                if (!isNil "_x") then {
                    _items append (_x select 0);
                };
            } forEach GVAR(customRightPanelButtons);
        };

        // "Regular" misc. items
        {
            ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_MISC_ITEMS) select {!(_x in _items)});
        // Unique items
        {
            ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_MISC_ITEMS) select {!(_x in _items)});
        // Unique backpacks
        {
            ["CfgVehicles", _x, false, true] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_BACKPACKS) select {!(_x in _items)});
        // Unique goggles
        {
            ["CfgGlasses", _x, false, true] call _fnc_fill_right_Container;
        } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_GOGGLES) select {!(_x in _items)});
    };
    // Custom buttons
    default {
        private _items = (GVAR(customRightPanelButtons) param [[RIGHT_PANEL_CUSTOM_BUTTONS] find _ctrlIDC, []]) param [0, []];

        if (_items isNotEqualTo []) then {
            // "Regular" misc. items
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_MISC_ITEMS) select {_x in _items});
            // Unique items
            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_MISC_ITEMS) select {_x in _items});
            // Unique backpacks
            {
                ["CfgVehicles", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_BACKPACKS) select {_x in _items});
            // Unique goggles
            {
                ["CfgGlasses", _x, false, true] call _fnc_fill_right_Container;
            } forEach ((GVAR(virtualItems) select IDX_VIRT_UNIQUE_GOGGLES) select {_x in _items});
        };
    };
};

// Reset right panel search bar
(_display displayCtrl IDC_rightSearchbar) ctrlSetText "";

GVAR(currentRightPanel) = _ctrlIDC;
[QGVAR(rightPanelFilled), [_display, GVAR(currentLeftPanel), _ctrlIDC]] call CBA_fnc_localEvent;

// Add current items, change progress bar of container load and get relevant container
if (GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) then {
    private _containerItems = [];
    private _container = switch (GVAR(currentLeftPanel)) do {
        // Uniform
        case IDC_buttonUniform: {
            // Update load bar
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadUniform GVAR(center));

            _containerItems = uniformItems GVAR(center);

            uniformContainer GVAR(center)
        };
        // Vest
        case IDC_buttonVest: {
            // Update load bar
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadVest GVAR(center));

            _containerItems = vestItems GVAR(center);

            vestContainer GVAR(center)
        };
        // Backpack
        case IDC_buttonBackpack: {
            // Update load bar
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadBackpack GVAR(center));

            _containerItems = backpackItems GVAR(center);

            backpackContainer GVAR(center)
        };
    };

    // Find out how many items of a type there are and update the number displayed
    private _class = "";

    for "_lbIndex" from 0 to (lnbSize _ctrlPanel select 0) - 1 do {
        _class = _ctrlPanel lnbData [_lbIndex, 0];
        _ctrlPanel lnbSetText [[_lbIndex, 2], str ({_x == _class} count _containerItems)];
    };

    // Refresh availibility of items based on space remaining in container
    [_ctrlPanel, _container, _containerItems isNotEqualTo []] call FUNC(updateRightPanel);
};

// Sorting
[_display, _control, _display displayCtrl IDC_sortRightTab] call FUNC(fillSort);

// Remove empty entries (for comparison below)
_itemsToCheck = _itemsToCheck - [""];

// Try to select previously selected item again, otherwise select first item ("Empty")
if (_itemsToCheck isNotEqualTo []) then {
    private _index = 0;

    for "_lbIndex" from 0 to (lbSize _ctrlPanel) - 1 do {
        if ((_ctrlPanel lbData _lbIndex) in _itemsToCheck) exitWith {
            _index = _lbIndex;
        };
    };

    _ctrlPanel lbSetCurSel _index;
} else {
    _ctrlPanel lbSetCurSel 0;
};
