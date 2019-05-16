#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Adds keyDown EH for overriding engine stance changes when in AT launcher stance.
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

[{!isNull (findDisplay 46)}, {
     (findDisplay 46) displayAddEventHandler ["KeyDown", {
         private _key = _this select 1;
         private _blockInput = false;
         if (currentWeapon player == secondaryWeapon player) then {
             switch (stance player) do {
                 case "STAND": {
                     if (_key in (actionKeys "moveDown")) then {
                         player playMoveNow "ACE_LauncherProne";
                         _blockInput = true;
                     };
                     if (_key in (actionKeys "moveUp")) then {
                         player playMoveNow "AmovPercMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
                         _blockInput = true;
                     };
                 };
                 case "CROUCH": {
                     if (_key in (actionKeys "moveDown")) then {
                         player playMoveNow "ACE_LauncherProne";
                         _blockInput = true;
                     };
                 };
                 case "PRONE": {
                     if (_key in (actionKeys "moveDown")) then {
                         //player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
                         player playMoveNow "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
                         player playMove "AmovPercMstpSrasWlnrDnon";
                         _blockInput = true;
                     };
                     if (_key in (actionKeys "moveUp")) then {
                         player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
                         //player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSnonWnonDnon";
                         //player playMove "AmovPknlMstpSrasWlnrDnon";
                         _blockInput = true;
                     };
                 };
                 default {};
             };
         };
         _blockInput
    }];
}] call CBA_fnc_waitUntilAndExecute;
