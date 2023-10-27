#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"  
/*
 * Author: PabstMirror
 * Checks if actionName is being pressed (from ui "KeyDown" event data)
 * Limitations: Does not check joysticks, different left/right modifier keys, double tap binds
 *
 * Arguments:
 * 0: Action Name <STRING>
 * 1: Key <NUMBER>
 * 2: Shift <BOOL>
 * 3: Ctrl <BOOL>
 * 4: Alt <BOOL>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * ["Watch", 24, false, false, false] call ace_common_fnc_actionKeyPressed
 * ["TeamSwitch", 22, false, true, false] call ace_common_fnc_actionKeyPressed
 *
 * Public: No
 */

 params [["_actionName", "", [""]], ["_key", -1, [0]], ["_shift", false, [false]], ["_ctrl", false, [false]], ["_alt", false, [false]]];

private _return = false;
private _actionKeys = actionKeysEx _actionName;
{
    _x params [["_mainKeyArray", []], ["_comboKeyArray", []], ["_isDoubleTap", false]];
    _mainKeyArray params ["_mainDik", "_mainDevice"];
    if (
        (_mainDik == _key)
        && {_mainDevice == "KEYBOARD"}
        && (if (_comboKeyArray isEqualTo []) then {
            (!_shift) && {!_ctrl} && {!_alt}
        } else {
            _comboKeyArray params ["_comboDik", "_comboDevice"];
            (_comboDevice == "KEYBOARD") 
            && {(_shift) isEqualTo (_comboDik in [DIK_LSHIFT,DIK_RSHIFT])}
            && {(_ctrl) isEqualTo (_comboDik in [DIK_LCONTROL,DIK_RCONTROL])}
            && {(_alt) isEqualTo (_comboDik in [DIK_LALT, DIK_RALT])}
        })
        && {!_isDoubleTap}
    ) exitWith { _return = true };
} forEach _actionKeys;

_return
