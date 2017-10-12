#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _ctrlIDC = ctrlIDC _control;

if !(isNil QGVAR(currentRightPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentRightPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit FADE_DELAY;
};

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

private _fnc_fill_right_ACC = {
    params ["_configPath"];

    private _displayName = getText (_configPath >> "displayName");
    private _lbAdd = _ctrlPanel lbAdd _displayName;

    _ctrlPanel lbSetdata [_lbAdd, _x];
    _ctrlPanel lbSetPicture [_lbAdd, geTtext (_configPath >> "picture")];
    _ctrlPanel lbSetTooltip [_lbAdd,format ["%1\n%2", _displayName, _x]];
    _configPath call ADDMODICON;
};

private _fnc_fill_right_Container = {
    params ["_configPath"];

    private _displayName = getText (_configPath >> "displayName");
    private _lbAdd = _ctrlPanel lnbAddRow ["", _displayName, str 0];
    private _columns = count lnbGetColumnsPosition _ctrlPanel;

    _ctrlPanel lnbSetData [[_lbAdd, 0], _x];
    _ctrlPanel lnbSetPicture [[_lbAdd, 0], getText (_configPath >> "picture")];
    _ctrlPanel lnbSetValue [[_lbAdd, 0], getNumber (_configPath >> "mass")];
    _ctrlPanel lbSetTooltip [_lbAdd * _columns,format ["%1\n%2", _displayName, _x]];
};

private _compatibleItems = [];
_compatibleMagazines = (getArray (configfile >> "cfgweapons" >> primaryWeapon GVAR(center) >> "magazines")) + 
    (getArray (configfile >> "cfgweapons" >> secondaryWeapon GVAR(center) >> "magazines")) + 
    (getArray (configfile >> "cfgweapons" >> handgunWeapon GVAR(center) >> "magazines"));
private _itemsToCheck = [];

private _ctrlPanel = _display displayCtrl IDC_rightTabContent;

switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonPrimaryWeapon : {
      _compatibleItems = (primaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
      _itemsToCheck = GVAR(currentItems) select 18;
    };
    case IDC_buttonHandgun : {
        _compatibleItems = (handgunWeapon GVAR(center)) call bis_fnc_compatibleItems;
        _itemsToCheck = GVAR(currentItems) select 20;
    };
    case IDC_buttonSecondaryWeapon : {
        _compatibleItems = (secondaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
        
        _itemsToCheck = GVAR(currentItems) select 19;
    };
    case IDC_buttonUniform;
    case IDC_buttonVest;
    case IDC_buttonBackpack : {
        _ctrlPanel = _display displayCtrl IDC_rightTabContentListnBox;
    };
};

lbClear (_display displayCtrl IDC_rightTabContentListnBox);
lbClear (_display displayCtrl IDC_rightTabContent);

(_display displayCtrl IDC_rightTabContentListnBox) lbSetCurSel -1;
(_display displayCtrl IDC_rightTabContent) lbSetCurSel -1;

private _leftPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon];

if (_ctrlIDC in [RIGHT_PANEL_ACC_IDCS] && {_leftPanelState}) then {
    private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
    _ctrlPanel lbsetvalue [_addEmpty, -1];
};

switch (_ctrlIDC) do {

    case IDC_buttonOptic : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 201 && {!_leftPanelState || {_x in _compatibleItems}}) then {
                if (_leftPanelState) then {
                    [_config] call _fnc_fill_right_ACC;
                } else {
                    [_config] call _fnc_fill_right_Container;
                };
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonItemAcc : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 301 && {!_leftPanelState || {_x in _compatibleItems}}) then {
                if (_leftPanelState) then {
                    [_config] call _fnc_fill_right_ACC;
                } else {
                    [_config] call _fnc_fill_right_Container;
                };
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonMuzzle : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 101  && {!_leftPanelState || {_x in _compatibleItems}}) then {
                if (_leftPanelState) then {
                    [_config] call _fnc_fill_right_ACC;
                } else {
                    [_config] call _fnc_fill_right_Container;
                };
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonBipod : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 302  && {!_leftPanelState || {_x in _compatibleItems}}) then {
                if (_leftPanelState) then {
                    [_config] call _fnc_fill_right_ACC;
                } else {
                    [_config] call _fnc_fill_right_Container;
                };
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonMag : {
        {
            private _config = configfile >> "CfgMagazines" >> _x;
            if (_x in _compatibleMagazines) then {
                [_config] call _fnc_fill_right_Container;
            };
        } foreach (GVAR(virtualItems) select 2);
    };

    case IDC_buttonMagALL : {
        {
            private _config = configfile >> "CfgMagazines" >> _x;
            [_config] call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 2);
    };

    case IDC_buttonThrow : {
        {
            private _config = configfile >> "CfgMagazines" >> _x;
            [_config] call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 15);
    };

    case IDC_buttonPut : {
        {
            private _config = configfile >> "CfgMagazines" >> _x;
            [_config] call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 16);
    };

    case IDC_buttonMisc : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            [_config] call _fnc_fill_right_Container;
        } foreach (GVAR(virtualItems) select 17);
    };
};

GVAR(currentRightPanel) = _ctrlIDC;

if (GVAR(currentLeftPanel) in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) then {
    private _container = switch (GVAR(currentLeftPanel)) do {
        case IDC_buttonUniform : {
            GVAR(currentItems) select 15
        };
        case IDC_buttonVest : {
            GVAR(currentItems) select 16
        };
        case IDC_buttonBackpack : {
            GVAR(currentItems) select 17
        };
    };

    for "_l" from 0 to (lbsize _ctrlPanel - 1) do {
        private _class = _ctrlPanel lnbData [_l, 0];
        _ctrlPanel lnbSetText [[_l, 2],str ({_x == _class} count _container)];
    };
};

for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
    private _currentData = _ctrlPanel lbData _lbIndex;

    if ({_x != "" && {_currentData == _x}} count _itemsToCheck > 0) then {
        TRACE_1("currentData", _currentData);
        _ctrlPanel lbSetCurSel _lbIndex;
    };
};

if (lbCurSel _ctrlPanel < 0) then {
    _ctrlPanel lbSetCurSel 0;
};
