#include "..\script_component.hpp"
/*
 * Author: Hypoxic, PabstMirror
 * Gets keybind name from CBA
 *
 * Arguments:
 * 0: Addon <STRING>
 * 1: Key Name <STRING>
 *
 * Return Value:
 * <STRING>
 *
 * Example:
 * ["ACE3 Common", "ace_interact_menu_selfInteractKey"] call ace_fieldmanual_fnc_getKeybindName
 *
 * Public: No
 */

params ["_addon", "_keyName"];

private _return = _keyName;
with missionNamespace do { // hint is calling from uiNamespace
    private _keyInfo = [_addon, _keyName] call CBA_fnc_getKeybind;
    if (!isNil "_keyInfo") then {
        private _localizeInfo = _keyInfo select 8 param [0, []];
        if (_localizeInfo isEqualTo []) then {
            _return = format ["%1 -> %2", _addon, _keyInfo select 2];
        } else {
            _return = format ["%1 -> %2 (%3)", _addon, _keyInfo select 2, _localizeInfo call CBA_fnc_localizeKey];
        };
    };
};

_return
