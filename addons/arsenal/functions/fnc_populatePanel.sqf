#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _ctrlIDC = ctrlIDC _control;

private _fnc_panelLeft = {
    params ["_display", "_control", "_ctrlIDC"];

    if (isNil QGVAR(currentLeftPanel) || {GVAR(currentLeftPanel) != _ctrlIDC}) then {

        if !(isNil QGVAR(currentLeftPanel)) then {
            private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
            _previousCtrlBackground ctrlSetFade 1;
            _previousCtrlBackground ctrlCommit FADE_DELAY;
        };
        
        private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
        _ctrlBackground ctrlSetFade 0;
        _ctrlBackground ctrlCommit FADE_DELAY;

        // Handle icons
        switch true do { 
            case (_ctrlIDC in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon]) : {
                {
                    _x = _display displayCtrl _x;

                    if (ctrlFade _x != 0) then {
                        _x ctrlSetFade 0;
                    };
                    if !(ctrlShown _x) then {
                        _x ctrlShow true;
                    };
                    _x ctrlCommit FADE_DELAY;
                } foreach [
                    IDC_blockRightFrame, 
                    IDC_blockRighttBackground,
                    IDC_loadIndicator,
                    IDC_rightTabContent,
                    IDC_sortRightTab,
                    RIGHT_PANEL_ACC_IDCS,
                    RIGHT_PANEL_REMOVE_IDCS
                ];

                {
                    _x = _display displayCtrl _x;

                    if (ctrlFade _x != 1) then {
                        _x ctrlSetFade 1;
                    };
                    if (ctrlShown _x) then {
                        _x ctrlShow false;
                    };
                    _x ctrlCommit FADE_DELAY;
                } foreach [
                    IDC_loadIndicator,
                    RIGHT_PANEL_ITEMS_IDCS,
                    RIGHT_PANEL_ITEMS_BACKGROUND_IDCS,
                    RIGHT_PANEL_REMOVE_IDCS
                ];
            };
            case (_ctrlIDC in [IDC_buttonUniform, IDC_buttonVest, IDC_buttonBackpack]) : {

                {
                    _x = _display displayCtrl _x;

                    if (ctrlFade _x != 0) then {
                        _x ctrlSetFade 0;
                    };
                    if !(ctrlShown _x) then {
                        _x ctrlShow true;
                    };
                    _x ctrlCommit FADE_DELAY;
                } foreach [
                    IDC_blockRightFrame, 
                    IDC_blockRighttBackground,
                    IDC_loadIndicator,
                    IDC_rightTabContent,
                    IDC_sortRightTab,
                    IDC_tabRight,
                    RIGHT_PANEL_ACC_IDCS,
                    RIGHT_PANEL_ITEMS_IDCS,
                    RIGHT_PANEL_REMOVE_IDCS
                ];
            };
            default {
                {
                    _x = _display displayCtrl _x;
                    if (ctrlFade _x != 1) then {
                        _x ctrlSetFade 1;
                    };
                    if (ctrlShown _x) then {
                        _x ctrlShow false;
                    };
                    _x ctrlCommit FADE_DELAY;
                } foreach [
                    IDC_blockRightFrame, 
                    IDC_blockRighttBackground,
                    IDC_loadIndicator,
                    IDC_rightTabContent,
                    IDC_sortRightTab,
                    RIGHT_PANEL_ACC_IDCS,
                    RIGHT_PANEL_ITEMS_IDCS,
                    RIGHT_PANEL_REMOVE_IDCS,
                    IDC_rightSearchbar
                ];
            };
        };
        GVAR(currentLeftPanel) = _ctrlIDC;
    };
};

private _fnc_panelRight = {
    params ["_display", "_control", "_ctrlIDC"];

    TRACE_3("panelRight",_display,_control,_ctrlIDC);

    if (isNil QGVAR(currentRightPanel) || {GVAR(currentRightPanel) != _ctrlIDC}) then {

        if !(isNil QGVAR(currentRightPanel)) then {
            private _previousCtrlBackground  = _display displayCtrl (GVAR(currentRightPanel) - 1);
            _previousCtrlBackground ctrlSetFade 1;
            _previousCtrlBackground ctrlCommit FADE_DELAY;
        };
        
        private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
        _ctrlBackground ctrlShow true;
        _ctrlBackground ctrlSetFade 0;
        _ctrlBackground ctrlCommit FADE_DELAY;

        GVAR(currentRightPanel) = _ctrlIDC;
    };
};

switch (_ctrlIDC) do {

    case IDC_buttonPrimaryWeapon : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonHandgun : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonSecondaryWeapon : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonHeadgear : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonUniform : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonVest: {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonBackpack : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonGoggles : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonNVG : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonBinoculars : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonMap : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonGPS : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonRadio : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonCompass : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonWatch : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonFace : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonVoice : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonInsigna : {
        [_display, _control, _ctrlIDC] call _fnc_panelLeft
    };
    case IDC_buttonMag : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMagALL : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonThrow : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonPut : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
    case IDC_buttonMisc : {
        [_display, _control, _ctrlIDC] call _fnc_panelRight
    };
};