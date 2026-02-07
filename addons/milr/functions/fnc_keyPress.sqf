#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Key Handler
 *
 * Arguments:
 * 0: Key Function <STRING>
 * 1: Key Down <BOOL>
 *
 * Return Value:
 * Key Handled <BOOL>
 *
 * Example:
 * ["range", true] call ace_milr_fnc_keyPress
 *
 * Public: No
 */
if (GVAR(pfid) == -1) exitWith { false }; // fast exit if not equipped
params ["_func", "_keyDown"];
private _player = ACE_player;
if !([_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith { false };
if !(_player call CBA_fnc_canUseWeapon) exitWith { false };

switch (_func) do {
    case "range": {
        if (_keyDown) then {
            GVAR(data) set ["range", RANGE_IN_PROGRESS];
            GVAR(data) set ["range_keyDownStart", CBA_missionTime];
        } else {
            private _holdTime = CBA_missionTime - (GVAR(data) getOrDefault ["range_keyDownStart", 0]);
            // very long hold to clear
            private _range = if (_holdTime < 5) then { [_player] call FUNC(getRange) } else { 0 };
            TRACE_1("Updating range",_range);
            GVAR(data) set ["range", _range];
            // systemChat format ["DEBUG: range: %1 meters", _range];
        };
    };
    default { ERROR_1("Unknown keyPress function: %1",_func); };
};
call FUNC(display_refresh);

true // return
