/*
 * Author: Alganthe
 * Fill  left panel.
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

if !(isNil QGVAR(currentLeftPanel)) then {
    private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
    _previousCtrlBackground ctrlSetFade 1;
    _previousCtrlBackground ctrlCommit FADE_DELAY;
};

private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
_ctrlBackground ctrlSetFade 0;
_ctrlBackground ctrlCommit FADE_DELAY;

// Force a "refresh" animation of the panel
_ctrlPanel ctrlSetFade 1;
_ctrlPanel ctrlCommit 0;
_ctrlPanel ctrlSetFade 0;
_ctrlPanel ctrlCommit FADE_DELAY;

_ctrlPanel lbSetCurSel -1;

// Handle icons and filling
switch true do {
    case (_ctrlIDC in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]) : {
        // Purge old data
        lbClear _ctrlPanel;
        private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
        _ctrlPanel lbsetvalue [_addEmpty, -1];

        {
            ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
        } foreach ((GVAR(virtualItems) select 0) select ([IDC_buttonPrimaryWeapon, IDC_buttonSecondaryWeapon, IDC_buttonHandgun] find _ctrlIDC));
    };

    case (_ctrlIDC in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) : {

        lbClear _ctrlPanel;
        private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
        _ctrlPanel lbsetvalue [_addEmpty, -1];

        // Filling
        switch (_ctrlIDC) do {
            case IDC_buttonUniform : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 4);
            };

            case IDC_buttonVest : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 5);
            };

            case IDC_buttonBackpack : {
                {
                    ["CfgVehicles", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 6);
            };
        };
    };

    default {
        GVAR(currentRightPanel) = nil;

        lbClear _ctrlPanel;

        if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
            private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
            _ctrlPanel lbsetvalue [_addEmpty, -1];
        };

        switch (_ctrlIDC) do {
            case IDC_buttonHeadgear: {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 3);
            };
            case IDC_buttonGoggles : {
                {
                    ["CfgGlasses", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 7);
            };
            case IDC_buttonNVG : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 8);
            };
            case IDC_buttonBinoculars : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 9);
            };
            case IDC_buttonMap : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 10);
            };
            case IDC_buttonCompass : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 11);
            };
            case IDC_buttonRadio : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 12);
            };
            case IDC_buttonWatch : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 13);
            };
            case IDC_buttonGPS : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach (GVAR(virtualItems) select 14);
            };
            case IDC_buttonFace : {
                {
                    {
                        if (
                            getnumber (_x >> "disabled") == 0 && 
                            {getText (_x >> "head") != ""} && 
                            {configName _x != "Default"}
                        ) then {
                            private _configName = configName _x;
                            private _displayName = getText (_x >> "displayName");
                            private _lbAdd = _ctrlPanel lbAdd _displayName;
                            _ctrlPanel lbSetData [_lbAdd, _configName];
                            _ctrlPanel lbSetTooltip [_lbAdd,format ["%1\n%2",_displayName, _configName]];
                            _x call ADDMODICON;
                        };
                    } foreach ("isClass _x" configClasses _x);
                } foreach ("isClass _x" configClasses (configfile >> "cfgfaces"));
            };
            case IDC_buttonVoice : {
                private _voices = (configProperties [(configFile >> "CfgVoice"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true]) - [(configfile >> "CfgVoice" >> "NoVoice")];
                {
                    ["CfgVoice", configName _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
                } foreach _voices;
            };
            case IDC_buttonInsigna : {
                {
                    ["CfgUnitInsignia", configName _x, _ctrlPanel, "texture"] call FUNC(addListBoxItem);
                } foreach ("true" configClasses (configFile >> "CfgUnitInsignia"));
            };
        };
    };
};

// Done
if (GVAR(currentLeftPanel) != _ctrlIDC) then {
    (_display displayCtrl IDC_leftSearchbar) ctrlSetText "";
    (_display displayCtrl IDC_rightSearchbar) ctrlSetText "";
};

GVAR(currentLeftPanel) = _ctrlIDC;
[QGVAR(leftPanelFilled), [_display, _ctrlIDC, GVAR(currentRightPanel)]] call CBA_fnc_localEvent;

// Sort
private _sortLeftCtrl = _display displayCtrl IDC_sortLeftTab;
[_sortLeftCtrl, _sortLeftCtrl lbValue (lbCurSel _sortLeftCtrl)] call FUNC(sortPanel);

//Select current item
private _itemsToCheck = ((GVAR(currentItems) select [0,15]) + [GVAR(currentFace), GVAR(currentVoice), GVAR(currentInsignia)]) apply {tolower _x};

for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
    private _currentData = _ctrlPanel lbData _lbIndex;

    if (!(_currentData isEqualTo "") && {tolower _currentData in _itemsToCheck}) exitWith {
        _ctrlPanel lbSetCurSel _lbIndex;
    };
};
if (lbCurSel _ctrlPanel < 0) then {
    _ctrlPanel lbSetCurSel 0;
};
