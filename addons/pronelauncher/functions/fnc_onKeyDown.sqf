#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Handles keyDown EH for overriding engine stance changes when in AT launcher stance.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

private _key = _this select 1;
private _blockInput = false;
if !([ACE_player] call CBA_fnc_canUseWeapon) exitWith {_blockInput};
if (currentWeapon ACE_Player != secondaryWeapon ACE_Player) exitwith {_blockInput};
switch (stance ACE_Player) do {
    case "STAND": {
        if (_key in (actionKeys "moveDown")) then {
            ACE_Player playMoveNow "ACE_LauncherProne";
            _blockInput = true;
        };
    };
    case "CROUCH": {
        if (_key in (actionKeys "moveDown")) then {
            ACE_Player playMoveNow "ACE_LauncherProne";
            _blockInput = true;
        };
    };
    case "PRONE": {
        if (_key in (actionKeys "moveDown")) then {
            ACE_Player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
            _blockInput = true;
        };
        if (_key in (actionKeys "moveUp")) then {
            ACE_Player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
            _blockInput = true;
        };
};
default {};
};

_blockInput
