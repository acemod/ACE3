#include "script_component.hpp"
#include "..\defines.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: Alganthe
 * Handles keyboard inputs in arsenal.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Key being pressed <SCALAR>
 * 2: Shift state <BOOL>
 * 3: Ctrl state <BOOL>
 * 4: Alt state <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["_display", "_keyPressed", "_shiftState", "_ctrlState", "_altState"];

GVAR(shiftState) = _shiftState;
private _return = true;
private _loadoutsDisplay = findDisplay IDD_loadouts_display;

if !(_loadoutsDisplay isEqualTo displayNull) then {
    if !(GVAR(loadoutsSearchbarFocus)) then {
        switch true do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay 2;
            };
            // Search field
            case (_keyPressed == DIK_F && {_ctrlState}): {
                ctrlSetFocus (_loadoutsDisplay displayCtrl IDC_loadoutsSearchbar);
            };
        };
    } else {
        switch true do {
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay 2;
            };
            case (_keyPressed == DIK_BACKSPACE): {
                _return = false;
            };
            case (_keyPressed == DIK_NUMPADENTER);
            case (_keyPressed == DIK_RETURN): {
                [_loadoutsDisplay, _loadoutsDisplay displayCtrl IDC_loadoutsSearchbar] call FUNC(handleLoadoutsSearchBar);
            };
            case (_keyPressed in [DIK_LEFT, DIK_RIGHT]): {
                _return = false;
            };
        };
    };

    switch true do {
        case (_keyPressed == DIK_C && {_ctrlState}): {
            _return = false;
        };
        case (_keyPressed == DIK_V && {_ctrlState}): {
            _return = false;
        };
        case (_keyPressed == DIK_A && {_ctrlState}): {
            _return = false;
        };
        case (_keyPressed == DIK_X && {_ctrlState}): {
            _return = false;
        };
        case (GVAR(loadoutsPanelFocus) && {_keyPressed in [DIK_UP, DIK_DOWN]}): {
            _return = false;
        };
    };
} else {

    if (!GVAR(leftSearchbarFocus) && {!GVAR(rightSearchbarFocus)}) then {

        switch true do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay 2;
            };
            // Hide button
            case (_keyPressed == DIK_BACKSPACE): {
                [_display] call FUNC(buttonHide);
            };
            // Export button / export classname
            case (_keyPressed == DIK_C && {_ctrlState}): {
                if (GVAR(leftTabFocus) || {GVAR(rightTabFocus)} || {GVAR(rightTabLnBFocus)}) then {
                    switch true do {
                        case (GVAR(leftTabFocus)): {
                            private _control = (_display displayCtrl IDC_leftTabContent);
                            _control lbData (lbCurSel _control)
                        };
                        case (GVAR(rightTabFocus)): {
                            private _control = (_display displayCtrl IDC_rightTabContent);
                            _control lbData (lbCurSel _control)
                        };
                        case (GVAR(rightTabLnBFocus)): {
                            private _control = (_display displayCtrl IDC_rightTabContentListnBox);
                            _control lnbData [(lnbCurSelRow _control), 0]
                        };
                    } params ["_className"];

                    "ace_clipboard" callExtension (_className + ";");
                    "ace_clipboard" callExtension "--COMPLETE--";

                    [_display, localize LSTRING(exportedClassnameText)] call FUNC(message);
                } else {
                    [_display] call FUNC(buttonExport);
                };
            };
            // Import button
            case (_keyPressed == DIK_V && {_ctrlState}): {
                [_display] call FUNC(buttonImport);
            };
            // Search fields
            case (_keyPressed == DIK_F && {_ctrlState}): {
                ctrlSetFocus (_display displayCtrl IDC_leftSearchbar);
            };
            // Switch vision mode
            case (_keyPressed in (actionkeys "nightvision")): {
                if (isNil QGVAR(visionMode)) then {
                    GVAR(visionMode) = 0;
                };
                GVAR(visionMode) = (GVAR(visionMode) + 1) % 3;

                switch GVAR(visionMode) do {
                    //--- Normal
                    case 0: {
                        camusenvg false;
                        false setCamUseTi 0;
                    };
                    //--- NVG
                    case 1: {
                        camusenvg true;
                        false setCamUseTi 0;
                    };
                    //--- TI
                    default {
                        camusenvg false;
                        true setCamUseTi 0;
                    };
                };

                playsound ["RscDisplayCurator_visionMode",true];
            };
            // Panel up down
            case (_keyPressed in [DIK_UP, DIK_DOWN]): {
                if (GVAR(leftTabFocus) || {GVAR(rightTabFocus)} || {GVAR(rightTabLnBFocus)}) then {
                    _return = false;
                };
            };
            // Right panel lnb + and - buttons
            case (_keyPressed in [DIK_LEFT, DIK_RIGHT]): {
                if (GVAR(rightTabLnBFocus)) then {
                    [_display, [1, 0] select (_keyPressed == DIK_LEFT)] call FUNC(buttonCargo);
                };
            };
        };
    } else {
        switch true do {
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay 2;
            };
            case (_keyPressed == DIK_BACKSPACE): {
                _return = false;
            };
            case (_keyPressed == DIK_NUMPADENTER);
            case (_keyPressed == DIK_RETURN): {
                if (GVAR(leftSearchbarFocus)) then {
                    [_display, _display displayCtrl IDC_leftSearchbar] call FUNC(handleSearchBar);
                }; 
                if (GVAR(rightSearchbarFocus)) then {
                    [_display, _display displayCtrl IDC_rightSearchbar] call FUNC(handleSearchBar);
                };
            };
            case (_keyPressed in [DIK_LEFT, DIK_RIGHT]): {
                _return = false;
            };
            case (_keyPressed == DIK_C && {_ctrlState}): {
                _return = false;
            };
            case (_keyPressed == DIK_V && {_ctrlState}): {
                _return = false;
            };
            case (_keyPressed == DIK_A && {_ctrlState}): {
                _return = false;
            };
            case (_keyPressed == DIK_X && {_ctrlState}): {
                _return = false;
            };
            // Search fields
            case (_keyPressed == DIK_F && {_ctrlState}): {
                if (GVAR(rightSearchbarFocus)) then {
                    ctrlSetFocus (_display displayCtrl IDC_leftSearchbar);
                } else {
                    ctrlSetFocus (_display displayCtrl IDC_rightSearchbar);
                };
            };
        };
    };
};

_return
