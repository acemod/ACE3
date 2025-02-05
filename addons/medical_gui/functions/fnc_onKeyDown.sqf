#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: AmsteadRayle
 * Handles keyboard inputs in medical menu.
 *
 * Arguments:
 * 1: Args <ARRAY>
 * - 0: Menu display <DISPLAY>
 * - 1: Key being pressed <NUMBER>
 * - 2: Shift state <BOOL>
 * - 3: Ctrl state <BOOL>
 * - 4: Alt state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["", [displayNull, 5, false, false, false]] call ace_medical_gui_fnc_onKeyDown
 *
 * Public: No
*/
// TODO: Is the airway category ever visible? Can the dynamic category stuff be removed?

#define NUMBER_KEYS [DIK_1, DIK_2, DIK_3, DIK_4, DIK_5, DIK_6, DIK_7, DIK_8, DIK_9, DIK_0]
#define ALL_CATEGORIES ["triage", "examine", "bandage", "medication", "airway", "advanced", "drag", "toggle"]

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
private _temp_idc = 0;

switch (true) do {
// Dynamically assign number keys to visible categories
    {
        _temp_category = _x; // _x does not exist inside case code
        _temp_idc = IDC_TRIAGE + (ALL_CATEGORIES find _temp_category) * 10;
        case (_keyPressed == _y && {GVAR(selectedCategory) != _temp_category}): {
            if (ctrlEnabled _temp_idc) then {
                if (_temp_category == "toggle") then {
                    call FUNC(handleToggle);
                } else {
                    GVAR(selectedCategory) = _temp_category;
                };
            } else {
                _return = false;
            };
        };
    } forEach _keyCategoryPairs;

// Select body part through similar keyboard layout:
//     w
//   a s d
//    z x
    case (_keyPressed == DIK_W && {GVAR(selectedBodyPart) != 0}): {
        GVAR(selectedBodyPart) = 0;
    };
    case (_keyPressed == DIK_S && {GVAR(selectedBodyPart != 1)}): {
        GVAR(selectedBodyPart) = 1;
    };
    case (_keyPressed == DIK_D && {GVAR(selectedBodyPart) != 2}): {
        GVAR(selectedBodyPart) = 2;
    };
    case (_keyPressed == DIK_A && {GVAR(selectedBodyPart) != 3}): {
        GVAR(selectedBodyPart) = 3;
    };
    case (_keyPressed == DIK_X && {GVAR(selectedBodyPart) != 4}): {
        GVAR(selectedBodyPart) = 4;
    };
    case (_keyPressed == DIK_Z && {GVAR(selectedBodyPart) != 5}): {
        GVAR(selectedBodyPart) = 5;
    };

    default {
        _return = false; // Do not override existing keybinds for keys not used here
    };
};

if (_return) then {
    playSound ["SoundClick", true]
};

_return
