#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles key presses
 *
 * Arguments:
 * 0: Type <STRING>
 * 1: IsKeyDown <BOOL>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * ["range", true] call ace_xm157_fnc_keyPress
 *
 * Public: No
 */

params ["_func", "_keyDown"];

if (!GVAR(shown)) exitWith { false }; // fast exit if not shown
if (!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))) exitWith { false };
if (!(ACE_player call CBA_fnc_canUseWeapon)) exitWith { false };

if (currentMuzzle ACE_player != currentWeapon ACE_player) exitWith { false };
private _display = uinamespace getVariable [QGVAR(display), displayNull];
if (isNull _display) exitWith { ERROR("keyPress-no display"); false };

if (_keyDown) then { playSound QGVAR(click); };
GVAR(data) set ["lastInputTime", CBA_missionTime];

call {
    if (_func == "range") exitWith {
        if (_keyDown) then {
            GVAR(data) set ["range_keyDownStart", CBA_missionTime];
        } else {
            private _holdTime = CBA_missionTime - (GVAR(data) getOrDefault ["range_keyDownStart", 0]);
            private _range = 0;
            if (_holdTime < 0.5) then {
                private _distance = round parseNumber ctrlText (_display displayCtrl 151);
                if (_distance > 10 && {_distance < RANGEFINDER_MAX}) then {
                    _range = _distance;
                } else {
                    _range = -1; // bad return
                };
            };
            TRACE_1("Updating range",_range);
            GVAR(data) set ["range", _range];
        };
    };
    if (!_keyDown) exitWith {};

    GVAR(data) set ["menu_updated", true];
    private _index = GVAR(data) getOrDefault ["menu_index", 0];
    if (_func in ["left", "right"]) exitWith {
        _index = (_index + ([-1, 1] select (_func == "right")) + count GVAR(menu)) % count GVAR(menu);
        GVAR(data) set ["menu_index", _index];
    };
    (GVAR(menu) # _index) params ["", "_var", "_thing", ["_upAction", {}], ["_downAction", {}]];
    if (_func == "up") exitWith {
        [_index, _var, _thing] call _upAction;
    };
    if (_func == "down") exitWith {
        [_index, _var, _thing] call _downAction;
    };
};

true
