#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: mharis001
 * Handles keyboard input for the 3DEN attribute.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Key code <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [DISPLAY, 0] call ace_arsenal_fnc_attributeKeyDown
 *
 * Public: No
 */

params ["_display", "_keyCode"];
TRACE_2("Attribute key down",_display,_keyCode);

// Exit if attribute is not in focus
private _controlsGroup = uiNamespace getVariable QGVAR(attributeFocus);
if (isNil "_controlsGroup") exitWith {false};

switch (_keyCode) do {
    case DIK_LEFT;
    case DIK_NUMPADMINUS: {
        [_controlsGroup, false] call FUNC(attributeSelect);
        true
    };
    case DIK_RIGHT;
    case DIK_NUMPADPLUS: {
        [_controlsGroup, true] call FUNC(attributeSelect);
        true
    };
    default {false};
};
