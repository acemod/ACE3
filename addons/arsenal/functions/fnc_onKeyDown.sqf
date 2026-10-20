#include "..\script_component.hpp"
#include "..\defines.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: Alganthe, johnb43
 * Handles keyboard inputs in arsenal.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Key being pressed <NUMBER>
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

// If in loadout screen
if (!isNull _loadoutsDisplay) then {
    // If loadout search bar isn't focussed
    if (!GVAR(loadoutsSearchbarFocus)) then {
        switch (true) do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay IDC_CANCEL;
            };
            // Search field
            case (_keyPressed == DIK_F && {_ctrlState}): {
                ctrlSetFocus (_loadoutsDisplay displayCtrl IDC_loadoutsSearchbar);
            };
        };
    } else {
        // If loadout search bar is focussed
        switch (true) do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay IDC_CANCEL;
            };
            // Search
            case (_keyPressed == DIK_NUMPADENTER);
            case (_keyPressed == DIK_RETURN): {
                [_loadoutsDisplay, _loadoutsDisplay displayCtrl IDC_loadoutsSearchbar] call FUNC(handleLoadoutsSearchBar);
            };
            case (_keyPressed == DIK_BACKSPACE);
            case (_keyPressed in [DIK_LEFT, DIK_RIGHT]): {
                _return = false;
            };
        };
    };

    switch (true) do {
        case (_keyPressed in [DIK_C, DIK_V, DIK_A, DIK_X] && {_ctrlState});
        case (GVAR(loadoutsPanelFocus) && {_keyPressed in [DIK_UP, DIK_DOWN]}): {
            _return = false;
        };
    };
} else {
    // If in arsenal and no search bar is selected
    if (!GVAR(leftSearchbarFocus) && {!GVAR(rightSearchbarFocus)}) then {
        switch (true) do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay IDC_CANCEL;
            };
            // Hide button
            case (_keyPressed == DIK_BACKSPACE): {
                [_display] call FUNC(buttonHide);
            };
            // Export button / export classname
            case (_keyPressed == DIK_C && {_ctrlState}): {
                if (GVAR(leftTabFocus) || {GVAR(rightTabFocus)} || {GVAR(rightTabLnBFocus)}) then {
                    switch (true) do {
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
                            _control lnbData [lnbCurSelRow _control, 0]
                        };
                    } params ["_className"];

                    "ace" callExtension ["clipboard:append", [_className]];
                    "ace" callExtension ["clipboard:complete", []];

                    [_display, format ["%1 - %2", LLSTRING(exportedClassnameText), _className]] call FUNC(message);
                } else {
                    [_display] call FUNC(buttonExport);
                };
            };
            // Export Parent
            case (_keyPressed == DIK_P && {_ctrlState}): {
                if !(GVAR(leftTabFocus) || {GVAR(rightTabFocus)} || {GVAR(rightTabLnBFocus)}) exitWith {};
                switch (true) do {
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
                        _control lnbData [lnbCurSelRow _control, 0]
                    };
                } params ["_className"];

                private _cfgConfig = if (GVAR(leftTabFocus)) then {
                    switch (GVAR(currentLeftPanel)) do {
                        case IDC_buttonBackpack: {configFile >> "CfgVehicles"};
                        case IDC_buttonGoggles: {configFile >> "CfgGlasses"};
                        case IDC_buttonFace: {configFile >> "CfgFaces"};
                        case IDC_buttonVoice: {configFile >> "CfgVoice"};
                        case IDC_buttonInsignia: {configFile >> "CfgUnitInsignia"};
                        default {configFile >> "CfgWeapons"};
                    }
                } else {
                    switch (GVAR(currentRightPanel)) do {
                        case IDC_buttonCurrentMag;
                        case IDC_buttonCurrentMag2;
                        case IDC_buttonThrow;
                        case IDC_buttonPut;
                        case IDC_buttonMag;
                        case IDC_buttonMagALL: {configFile >> "CfgMagazines"};
                        default {configFile >> "CfgWeapons"};
                    }
                };

                private _parent = configName inheritsFrom (_cfgConfig >> _className);
                "ace" callExtension ["clipboard:append", [_parent]];
                "ace" callExtension ["clipboard:complete", []];

                [_display, format ["%1 - %2", LLSTRING(exportedClassnameText), _parent]] call FUNC(message);
            };
            // Import button
            case (_keyPressed == DIK_V && {_ctrlState}): {
                [_display] call FUNC(buttonImport);
            };
            // Focus search
            case (_keyPressed == DIK_F && {_ctrlState}): {
                ctrlSetFocus (_display displayCtrl IDC_leftSearchbar);
            };
            // Switch vision mode
            case (_keyPressed in (actionKeys "nightvision")): {
                if (isNil QGVAR(visionMode)) then {
                    GVAR(visionMode) = 0;
                };

                GVAR(visionMode) = (GVAR(visionMode) + 1) % 3;

                switch (GVAR(visionMode)) do {
                    // Normal
                    case 0: {
                        camUseNVG false;
                        false setCamUseTI 0;
                    };
                    // NVG
                    case 1: {
                        camUseNVG true;
                        false setCamUseTI 0;
                    };
                    // TI
                    default {
                        camUseNVG false;
                        true setCamUseTI 0;
                    };
                };

                playSound ["RscDisplayCurator_visionMode", true];
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
                    [_display, parseNumber (_keyPressed != DIK_LEFT)] call FUNC(buttonCargo);
                };
            };
        };
    } else {
        // If in arsenal and a search bar is selected
        switch (true) do {
            // Close button
            case (_keyPressed == DIK_ESCAPE): {
                _display closeDisplay IDC_CANCEL;
            };
            // Search
            case (_keyPressed == DIK_NUMPADENTER);
            case (_keyPressed == DIK_RETURN): {
                if (GVAR(leftSearchbarFocus)) then {
                    [_display, _display displayCtrl IDC_leftSearchbar] call FUNC(handleSearchBar);
                };

                if (GVAR(rightSearchbarFocus)) then {
                    [_display, _display displayCtrl IDC_rightSearchbar] call FUNC(handleSearchBar);
                };
            };
            case (_keyPressed in [DIK_LEFT, DIK_RIGHT]);
            case (_keyPressed == DIK_BACKSPACE);
            case (_keyPressed in [DIK_C, DIK_V, DIK_A, DIK_X] && {_ctrlState}): {
                _return = false;
            };
            // Focus search fields
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
