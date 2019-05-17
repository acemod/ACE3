#include "script_component.hpp"
/*
 * Author: PiZZADOX, Jonpas
 * Handles keyDown EH for overriding engine stance changes when in AT launcher stance.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Key <NUMBER>
 * 2: Shift <BOOL>
 * 3: Ctrl <BOOL>
 * 4: Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [control, 5, false, true, false] call ace_pronelauncher_fnc_onKeyDown
 *
 * Public: No
 */

params ["","_key"];

if !(isNull objectParent ACE_player) exitWith {false};
if (currentWeapon ACE_player != secondaryWeapon ACE_player) exitWith {false};

private _stance = stance ACE_player;
private _keysMoveDown = actionKeys "moveDown";
private _keysMoveUp = actionKeys "moveUp";

if (_stance in ["STAND", "CROUCH"] && {_key in _keysMoveDown}) exitWith {
    ACE_player playMoveNow "ACE_LauncherProne";
    true
};

if (_stance isEqualTo "PRONE") exitWith {
    if (_key in _keysMoveDown) exitWith {
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
        true
    };
    if (_key in _keysMoveUp) exitWith {
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
        true
    };
    false
};

false
