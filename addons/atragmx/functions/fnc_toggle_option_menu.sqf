/*
 * Author: Ruthberg
 * Toggles the option menu on/off
 *
 * Arguments:
 * open menu item <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_option_menu
 *
 * Public: No
 */
#include "script_component.hpp"

if (ctrlVisible 3001) then {
    if (_this) then {
        private _optionID = lbCurSel 3002;
        if (_optionID > 0) then {
            ctrlShow [3001, false];
            ctrlShow [3002, false];
            [_optionID] call FUNC(evaluate_option_menu_input);
        };
    } else {
        ctrlShow [3001, false];
        ctrlShow [3002, false];
    };
} else {
    lbClear 3002;
    
    lbAdd [3002, "Accuracy 1st"];
    lbAdd [3002, "Muz Vel Table"];
    lbAdd [3002, "Drag Coef Table"];
    lbAdd [3002, "Target Speed Est"];
    lbAdd [3002, "Target Range Est"];
    lbAdd [3002, "Truing Drop"];
    if (GVAR(showCoriolis)) then {
        lbAdd [3002, "Show Coriolis *"];
    } else {
        lbAdd [3002, "Show Coriolis"];
    };
    lbAdd [3002, "Set Clicks"];
    lbAdd [3002, "Gun Note"];
    
    lbSetCurSel [3002, 0];
    
    ctrlShow [3001, true];
    ctrlShow [3002, true];

    ctrlSetFocus ((uiNamespace getVariable ["ATragMX_Display", displayNull]) displayCtrl 3002);
};
