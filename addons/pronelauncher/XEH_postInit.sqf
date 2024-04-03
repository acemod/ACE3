#include "script_component.hpp"

addUserActionEventHandler ["Stand", "Activate", { // Stand (toggle)
    if ((!alive ACE_player) || {!(isNull objectParent ACE_player)}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if ((_launcherWeapon == "") || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if ((stance ACE_player) == "PRONE") then {
        TRACE_1("stand toggle",stance ACE_player);
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
        ACE_player playMove "AmovPknlMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
    };
}];

addUserActionEventHandler ["Crouch", "Activate", { // Crouch (toggle)
    if ((!alive ACE_player) || {!(isNull objectParent ACE_player)}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if ((_launcherWeapon == "") || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if ((stance ACE_player) == "PRONE") then {
        TRACE_1("crouch toggle",stance ACE_player);
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
    };
}];

addUserActionEventHandler ["Prone", "Activate", { // Prone (toggle)
    if ((!alive ACE_player) || {!(isNull objectParent ACE_player)}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if ((_launcherWeapon == "") || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    TRACE_1("prone toggle",stance ACE_player);

    // Make unit go prone (resets if key is pressed, so need to redo animation)
    ACE_player playMoveNow "ACE_LauncherProne";
}];

addUserActionEventHandler ["MoveUp", "Activate", { // (X) Crouch / Stand Up
    if ((!alive ACE_player) || {!(isNull objectParent ACE_player)}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if ((_launcherWeapon == "") || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if ((stance ACE_player) == "PRONE") then {
        TRACE_1("moveUp from prone",stance ACE_player);
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
    };
}];

addUserActionEventHandler ["MoveDown", "Activate", { // (Z) Go Prone / Stand Up
    if ((!alive ACE_player) || {!(isNull objectParent ACE_player)}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if ((_launcherWeapon == "") || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if ((stance ACE_player) == "PRONE") then {
        TRACE_1("moveDown from prone",stance ACE_player);
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
        ACE_player playMove "AmovPknlMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
    } else {
        TRACE_1("moveDown from non-prone",stance ACE_player);
        ACE_player playMoveNow "ACE_LauncherProne";
    };
}];
