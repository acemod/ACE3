#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: AmsteadRayle
 * Handles keyboard inputs in medical menu.
 *
 * Arguments:
 * 0: Menu display <DISPLAY>
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
// TODO: Is the airway category ever visible? Can the dynamic category stuff be removed?

#define NUMBER_KEYS [DIK_1, DIK_2, DIK_3, DIK_4, DIK_5, DIK_6, DIK_7, DIK_8, DIK_9, DIK_0]

params ["", "_args"];
_args params ["_display", "_keyPressed", "_shiftState", "_ctrlState", "_altState"];

private _return = true; // Override existing keybinds for keys used here

private _visibleCategories = [
    "bandage","medication","airway","advanced","drag"
] select {
    private _category = _x;
    (GVAR(actions) findIf {_category == _x select 1}) > -1
};

private _allCategories = ["triage", "examine"] + _visibleCategories + ["toggle"];

// Use hashmap as a shortcut to "zip" two arrays together
// Use categories as keys in hashmap because there are fewer,
// otherwise the hashmap is padded with nil
private _keyCategoryPairs = _allCategories createHashMapFromArray NUMBER_KEYS;

private _temp_category = "";

switch (true) do {
// Dynamically assign number keys to visible categories
    {
        _temp_category = _x; // _x does not exist inside case code
        case (_keyPressed == _y): {
            GVAR(selectedCategory) = _temp_category;
            if (_temp_category == "toggle") then {
                call FUNC(handleToggle);
            }
        };
    } forEach _keyCategoryPairs;

// Select body part through similar keyboard layout:
//     w
//   a s d
//    z x
    case (_keyPressed == DIK_W): {
        GVAR(selectedBodyPart) = 0;
    };
    case (_keyPressed == DIK_S): {
        GVAR(selectedBodyPart) = 1;
    };
    case (_keyPressed == DIK_D): {
        GVAR(selectedBodyPart) = 2;
    };
    case (_keyPressed == DIK_A): {
        GVAR(selectedBodyPart) = 3;
    };
    case (_keyPressed == DIK_X): {
        GVAR(selectedBodyPart) = 4;
    };
    case (_keyPressed == DIK_Z): {
        GVAR(selectedBodyPart) = 5;
    };

    default {
        _return = false; // Do not override existing keybinds for keys not used here
    };
};

_return
