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

_ctrlPanel lbSetCurSel -1;

// Handle icons and filling
switch true do {
    case (_ctrlIDC in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]) : {
        // Purge old data
        lbClear _ctrlPanel;
        private _addEmpty = _ctrlPanel lbadd format [" <%1>",localize "str_empty"];
        _ctrlPanel lbsetvalue [_addEmpty, -1];

        // Filling
        switch (_ctrlIDC) do {
            case IDC_buttonPrimaryWeapon : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach ((GVAR(virtualItems) select 0) select 0);
            };

            case IDC_buttonHandgun : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach ((GVAR(virtualItems) select 0) select 2);
            };

            case IDC_buttonSecondaryWeapon : {
                {
                    ["CfgWeapons", _x, _ctrlPanel] call FUNC(addListBoxItem);
                } foreach ((GVAR(virtualItems) select 0) select 1);
            };
        };
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
                        if (getnumber (_x >> "disabled") == 0 && gettext (_x >> "head") != "" && configname _x != "Default") then {
                            private _configName = configName _x;
                            private _displayName = gettext (_x >> "displayName");
                            private _lbAdd = _ctrlPanel lbadd _displayName;
                            _ctrlPanel lbsetdata [_lbAdd, _configName];
                            _ctrlPanel lbsettooltip [_lbAdd,format ["%1\n%2",_displayName, _configName]];
                            _x call ADDMODICON;
                        };
                    } foreach ("isclass _x" configclasses _x);
                } foreach ("isclass _x" configclasses (configfile >> "cfgfaces"));
            };
            case IDC_buttonVoice : {
                {
                    ["CfgVoice", configName _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
                } foreach configProperties [(configFile >> "CfgVoice"), "isClass _x && {getNumber (_x >> 'scope') == 2}", true];
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
[QGVAR(leftPanelFilled), [_display, _ctrlIDC]] call CBA_fnc_localEvent;

// Sort
private _sortLeftCtrl = _display displayCtrl IDC_sortLeftTab;
[_sortLeftCtrl, _sortLeftCtrl lbValue (lbCurSel _sortLeftCtrl)] call FUNC(sortPanel);

//Select current item
private _itemsToCheck = (GVAR(currentItems) select [0,14]) + [GVAR(currentFace), GVAR(currentVoice), GVAR(currentInsignia)];

for "_lbIndex" from 0 to (lbSize _ctrlPanel - 1) do {
    private _currentData = _ctrlPanel lbData _lbIndex;

    if (!(_currentData isEqualTo "") && {_currentData in _itemsToCheck}) exitWith {
        _ctrlPanel lbSetCurSel _lbIndex;
    };
};
if (lbCurSel _ctrlPanel < 0) then {
    _ctrlPanel lbSetCurSel 0;
};
