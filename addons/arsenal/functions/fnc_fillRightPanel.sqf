/*
 * Author: Alganthe
 * Fill right panel.
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
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _ctrlIDC = ctrlIDC _control;

// Fade old control background
if !(isNil QGVAR(currentRightPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentRightPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit FADE_DELAY;
};

// Show new control background
private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
_ctrlBackground ctrlShow true;
_ctrlBackground ctrlSetFade 0;
_ctrlBackground ctrlCommit FADE_DELAY;

private _searchbarCtrl = _display displayCtrl IDC_rightSearchbar;

if (!(ctrlShown _searchbarCtrl) || {ctrlFade _searchbarCtrl > 0}) then {
    _searchbarCtrl ctrlShow true;
    _searchbarCtrl ctrlSetFade 0;
    _searchbarCtrl ctrlCommit 0;
};

private _fnc_fill_right_Container = {
    params ["_configCategory", "_className", "_isMagazine", ["_isUnique", false, [false]]];

    private _cacheNamespace = _ctrlPanel;
    private _cachedItemInfo = _cacheNamespace getVariable [_configCategory+_className, []];

    // Not in cache. So get info and put into cache
    if (_cachedItemInfo isEqualTo []) then {
        private _configPath = configFile >> _configCategory >> _className;

        _cachedItemInfo set [0, getText (_configPath >> "displayName")];
        _cachedItemInfo set [1, getText (_configPath >> "picture")];
        _cachedItemInfo set [2, [getNumber (_configPath >> "itemInfo" >> "mass"), getNumber (_configPath >> "mass")] select _isMagazine];

        _cacheNamespace setVariable [_configCategory+_className, _cachedItemInfo];
    };

    _cachedItemInfo params ["_displayName","_picture", "_mass"];

    private _lbAdd = _ctrlPanel lnbAddRow ["", _displayName, "0"];
    private _columns = count lnbGetColumnsPosition _ctrlPanel;

    _ctrlPanel lnbSetData [[_lbAdd, 0], _x];
    _ctrlPanel lnbSetPicture [[_lbAdd, 0], _picture];
    _ctrlPanel lnbSetValue [[_lbAdd, 0], _mass];
    _ctrlPanel setVariable [_x, _mass];
    _ctrlPanel lnbSetValue [[_lbAdd, 2], [0, 1] select (_isUnique)];
    _ctrlPanel lbSetTooltip [_lbAdd * _columns,format ["%1\n%2", _displayName, _x]];
};

// Retrieve compatible mags
private _compatibleItems = [];
private _compatibleMagazines = [[[], []], [[], []], [[], []]];
{
    if (_x != "") then {
        private _weaponConfig = (configFile >> "CfgWeapons" >> _x);
        private _index = _forEachIndex;

        {
            private _subIndex = _forEachIndex;
            {
                ((_compatibleMagazines select _index) select _subIndex) pushBackUnique (configName (configFile >> "CfgMagazines" >> _x))
            } foreach ([getArray (_weaponConfig >> _x >> "magazines"), getArray (_weaponConfig >> "magazines")] select (_x == "this"));

            // Magazine groups
            {
                private _magazineGroups = uiNamespace getVariable [QGVAR(magazineGroups),["#CBA_HASH#",[],[],[]]];
                private _magArray = [_magazineGroups, toLower _x] call CBA_fnc_hashGet;
                {((_compatibleMagazines select _index) select _subIndex) pushBackUnique _x} forEach _magArray;
            } foreach ([getArray (_weaponConfig >> _x >> "magazineWell"), getArray (_weaponConfig >> "magazineWell")] select (_x == "this"));


        } foreach getArray (_weaponConfig >> "muzzles");
    };
} foreach [primaryWeapon GVAR(center), handgunWeapon GVAR(center), secondaryWeapon GVAR(center)];

private _itemsToCheck = [];
private _compatibleMagsPrimaryMuzzle = [];
private _compatibleMagsSecondaryMuzzle = [];

private _allCompatibleMags = [];
{
    _allCompatibleMags append (_x select 0);
    _allCompatibleMags append (_x select 1);
} foreach _compatibleMagazines;

private _ctrlPanel = _display displayCtrl IDC_rightTabContent;

switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonPrimaryWeapon : {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 0 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 0 select 1;
        _compatibleItems = (primaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
        _itemsToCheck = GVAR(currentItems) select 18;
    };

    case IDC_buttonHandgun : {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 1 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 1 select 1;
        _compatibleItems = (handgunWeapon GVAR(center)) call bis_fnc_compatibleItems;
        _itemsToCheck = GVAR(currentItems) select 20;
    };

    case IDC_buttonSecondaryWeapon : {
        _compatibleMagsPrimaryMuzzle = _compatibleMagazines select 2 select 0;
        _compatibleMagsSecondaryMuzzle = _compatibleMagazines select 2 select 1;
        _compatibleItems = (secondaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
        _itemsToCheck = GVAR(currentItems) select 19;
    };

    case IDC_buttonUniform;
    case IDC_buttonVest;
    case IDC_buttonBackpack : {
        _ctrlPanel = _display displayCtrl IDC_rightTabContentListnBox;
    };
};

// Force a "refresh" animation of the panel
_ctrlPanel ctrlSetFade 1;
_ctrlPanel ctrlCommit 0;
_ctrlPanel ctrlSetFade 0;
_ctrlPanel ctrlCommit FADE_DELAY;

_itemsToCheck = _itemsToCheck apply {toLower _x};
_compatibleItems =  _compatibleItems apply {toLower _x};

lbClear (_display displayCtrl IDC_rightTabContentListnBox);
lbClear (_display displayCtrl IDC_rightTabContent);

(_display displayCtrl IDC_rightTabContentListnBox) lbSetCurSel -1;
(_display displayCtrl IDC_rightTabContent) lbSetCurSel -1;

private _leftPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon];

if (_ctrlIDC in [RIGHT_PANEL_ACC_IDCS, IDC_buttonCurrentMag, IDC_buttonCurrentMag2] && {_leftPanelState}) then {
    private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
    _ctrlPanel lbsetvalue [_addEmpty, -1];
};

switch (_ctrlIDC) do {

    case IDC_buttonOptic : {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach (_compatibleItems arrayIntersect (((GVAR(virtualItems) select 1) select 0) apply {toLower _x}));
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 1) select 0);
            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 22) select 0);
        };
    };

    case IDC_buttonItemAcc : {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach (_compatibleItems arrayIntersect (((GVAR(virtualItems) select 1) select 1) apply {toLower _x}));
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 1) select 1);
            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 22) select 1);
        };
    };

    case IDC_buttonMuzzle : {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach (_compatibleItems arrayIntersect (((GVAR(virtualItems) select 1) select 2) apply {toLower _x}));
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 1) select 2);
            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 22) select 2);
        };
    };

    case IDC_buttonBipod : {
        if (_leftPanelState) then {
            {
                ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach (_compatibleItems arrayIntersect (((GVAR(virtualItems) select 1) select 3) apply {toLower _x}));
        } else {
            {
                ["CfgWeapons", _x, false] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 1) select 3);
            {
                ["CfgWeapons", _x, false, true] call _fnc_fill_right_Container;
            } foreach ((GVAR(virtualItems) select 22) select 3);
        };
    };

    case IDC_buttonCurrentMag : {
        if (_leftPanelState) then {
            {
                ["CfgMagazines", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach ((GVAR(virtualItems) select 2) arrayIntersect _compatibleMagsPrimaryMuzzle);
        };
    };

    case IDC_buttonCurrentMag2 : {
        if (_leftPanelState) then {
            {
                ["CfgMagazines", _x, _ctrlPanel] call FUNC(addListBoxItem);
            } foreach ((GVAR(virtualItems) select 2) arrayIntersect _compatibleMagsSecondaryMuzzle);
        };
    };

    case IDC_buttonMag : {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } foreach ((GVAR(virtualItems) select 2) arrayIntersect _allCompatibleMags);
        {
            ["CfgMagazines", _x, true, true] call _fnc_fill_right_Container;
        } foreach ((GVAR(virtualItems) select 19) arrayIntersect _allCompatibleMags);
    };

    case IDC_buttonMagALL : {
        {
            ["CfgMagazines", _x, true] call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 2);
        {
            ["CfgMagazines", _x, true, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 19);
    };

    case IDC_buttonThrow : {
        {
            ["CfgMagazines", _x, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 15);
        {
            ["CfgMagazines", _x, true, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 20);
    };

    case IDC_buttonPut : {
        {
            ["CfgMagazines", _x, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 16);
        {
            ["CfgMagazines", _x, true, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 21);
    };

    case IDC_buttonMisc : {
        {
            ["CfgWeapons", _x, false]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 17);
        {
            ["CfgWeapons", _x, false, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 18);
        {
            ["CfgVehicles", _x, false, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 23);
        {
            ["CfgGlasses", _x, false, true]  call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 24);
    };
};

(_display displayCtrl IDC_rightSearchbar) ctrlSetText "";

GVAR(currentRightPanel) = _ctrlIDC;

[QGVAR(rightPanelFilled), [_display, GVAR(currentLeftPanel), _ctrlIDC]] call CBA_fnc_localEvent;

// Add current items and change progress bar
if (GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) then {

    private _maxLoad = 0;
    private _container = switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonUniform : {
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadUniform GVAR(center));
            _maxLoad = gettext (configfile >> "CfgWeapons" >> uniform GVAR(center) >> "ItemInfo" >> "containerClass");
            uniformItems GVAR(center)
        };
        case IDC_buttonVest : {
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadVest GVAR(center));
            _maxLoad = gettext (configfile >> "CfgWeapons" >> vest GVAR(center) >> "ItemInfo" >> "containerClass");
            vestItems GVAR(center)
        };
        case IDC_buttonBackpack : {
            (_display displayCtrl IDC_loadIndicatorBar) progressSetPosition (loadBackpack GVAR(center));
            _maxLoad = backpack GVAR(center);
            backpackItems GVAR(center)
        };
    };

    for "_l" from 0 to ((lnbsize _ctrlPanel select 0) - 1) do {
        private _class = _ctrlPanel lnbData [_l, 0];
        _ctrlPanel lnbSetText [[_l, 2], ["0", str ({_x == _class} count _container)] select (_class in _container)];
    };

    [_ctrlPanel, _maxLoad] call FUNC(updateRightPanel);
};

// Sorting
private _sortRightCtrl = _display displayCtrl IDC_sortRightTab;
private _sortRightCurSel = lbCurSel _sortRightCtrl;

if (lbSize _sortRightCtrl == 3) then {
    _sortRightCtrl lbDelete 2;
};

if (_leftPanelState) then {
    _sortRightCtrl lbDelete 1;
    _sortRightCtrl lbAdd (localize "STR_a3_rscdisplayarsenal_sort_mod");
    _sortRightCtrl lbSetValue [1, 1];

    _sortRightCtrl lbSetCurSel ([0, _sortRightCurSel] select (_sortRightCurSel != 2));
} else {
    _sortRightCtrl lbDelete 1;
    _sortRightCtrl lbAdd localize LSTRING(sortByWeightText);
    _sortRightCtrl lbSetValue [1, 1];

    _sortRightCtrl lbAdd localize LSTRING(sortByAmountText);
    _sortRightCtrl lbSetValue [2, 2];

    _sortRightCtrl lbSetCurSel _sortRightCurSel;
};

[_sortRightCtrl, _sortRightCtrl lbValue (lbCurSel _sortRightCtrl)] call FUNC(sortPanel);

// Select current data if not in a container
if !(_itemsToCheck isEqualTo []) then {
    for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
        private _currentData = _ctrlPanel lbData _lbIndex;

        if ((_currentData != "") && {tolower _currentData in _itemsToCheck}) exitWith {
            _ctrlPanel lbSetCurSel _lbIndex;
        };
    };

    if (lbCurSel _ctrlPanel < 0) then {
        _ctrlPanel lbSetCurSel 0;
    };
};
