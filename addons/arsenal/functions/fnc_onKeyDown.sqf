#include "script_component.hpp"
#include "..\defines.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

params ["", "_args"];
_args params ["_display", "_keyPressed", "_shiftState", "_ctrlState", "_altState"];

GVAR(shiftState) = _shiftState;

private _return = true;

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
        // Export button
        case (_keyPressed == DIK_C): {
            if (_ctrlState) then  {
                [_display] call FUNC(buttonExport);
            };
        };
        // Import button
        case (_keyPressed == DIK_V): {
            if (_ctrlState) then {
                [_display] call FUNC(buttonImport);
            };
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
    };
} else {
    switch true do {
        case (_keyPressed == DIK_ESCAPE): {
            _display closeDisplay 2;
        };
        case (_keyPressed == DIK_BACKSPACE): {
            _return = false;
        };
        case (_keyPressed == DIK_RETURN): {
            if (GVAR(leftSearchbarFocus)) then {
                [_display, _display displayCtrl IDC_leftSearchbar] call FUNC(handleSearchBar);
            }; 
            if (GVAR(rightSearchbarFocus)) then {
                [_display, _display displayCtrl IDC_rightSearchbar] call FUNC(handleSearchBar);
            };
        };
    };
};

if (GVAR(leftTabFocus) && {_keyPressed in [DIK_UP, DIK_DOWN]}) then {
    _return = false;
};

if (GVAR(rightTabFocus) && {_keyPressed in [DIK_UP, DIK_DOWN]}) then {
    _return = false;
};

if (GVAR(rightTabLnBFocus) && {_keyPressed in [DIK_UP, DIK_DOWN]}) then {
    _return = false;
};

_return