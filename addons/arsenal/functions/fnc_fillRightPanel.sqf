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
private _ctrlPanel = _display displayCtrl IDC_rightTabContent;
if (!(ctrlShown _searchbarCtrl) || {ctrlFade _searchbarCtrl > 0}) then {
    _searchbarCtrl ctrlShow true;
    _searchbarCtrl ctrlSetFade 0;
    _searchbarCtrl ctrlCommit 0;
};

private _fnc_fill_right = {
    params ["_configPath"];

    private _displayName = getText (_configPath >> "displayName");

    private _lbAdd = _ctrlPanel lbAdd _displayName;

    _ctrlPanel lbSetdata [_lbAdd, _x];
    _ctrlPanel lbSetPicture [_lbAdd, geTtext (_configPath >> "picture")];
    _ctrlPanel lbSetTooltip [_lbAdd,format ["%1\n%2", _displayName, _x]];
    _configPath call ADDMODICON;
};

 private _compatibleItems = [];
switch (GVAR(currentLeftPanel)) do {
    case IDC_buttonPrimaryWeapon : {
      _compatibleItems = (primaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
    };
    case IDC_buttonHandgun : {
        _compatibleItems = (handgunWeapon GVAR(center)) call bis_fnc_compatibleItems;
    };
    case IDC_buttonSecondaryWeapon : {
        _compatibleItems = (secondaryWeapon GVAR(center)) call bis_fnc_compatibleItems;
    };
};

lbClear _ctrlPanel;

_ctrlPanel lbSetCurSel -1;
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
                [_config] call _fnc_fill_right;
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonItemAcc : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 301 && {!_leftPanelState || {_x in _compatibleItems}}) then {
                [_config] call _fnc_fill_right;
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonMuzzle : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 101  && {!_leftPanelState || {_x in _compatibleItems}}) then {
                [_config] call _fnc_fill_right;
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonBipod : {
        {
            private _config = configfile >> "CfgWeapons" >> _x;
            if (getNumber (_config >> "ItemInfo" >> "type") == 302  && {!_leftPanelState || {_x in _compatibleItems}}) then {
                [_config] call _fnc_fill_right;
            };
        } foreach (GVAR(virtualItems) select 1);
    };

    case IDC_buttonMag : {

    };

    case IDC_buttonMagALL : {

    };

    case IDC_buttonThrow : {

    };

    case IDC_buttonPut : {

    };

    case IDC_buttonMisc : {

    };
};

GVAR(currentRightPanel) = _ctrlIDC;
