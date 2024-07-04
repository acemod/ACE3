#include "script_component.hpp"

// Stand (toggle)
addUserActionEventHandler ["Stand", "Activate", {
    if (!alive ACE_player || {!isNull objectParent ACE_player} || {!isNull curatorCamera}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if (_launcherWeapon == "" || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if (stance ACE_player == "PRONE") then {
        LOG("stand toggle");
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
        ACE_player playMove "AmovPknlMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
    };
}];

// Crouch (toggle)
addUserActionEventHandler ["Crouch", "Activate", {
    if (!alive ACE_player || {!isNull objectParent ACE_player} || {!isNull curatorCamera}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if (_launcherWeapon == "" || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if (stance ACE_player == "PRONE") then {
        LOG("crouch toggle");
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
    };
}];

// Prone (toggle)
addUserActionEventHandler ["Prone", "Activate", {
    if (!alive ACE_player || {!isNull objectParent ACE_player} || {!isNull curatorCamera}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if (_launcherWeapon == "" || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    TRACE_1("prone toggle",stance ACE_player);

    // Make unit go prone (resets if key is pressed, so need to redo animation)
    ACE_player playMoveNow "ACE_LauncherProne";
}];

// (X) Crouch / Stand Up
addUserActionEventHandler ["MoveUp", "Activate", {
    if (!alive ACE_player || {!isNull objectParent ACE_player} || {!isNull curatorCamera}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if (_launcherWeapon == "" || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if (stance ACE_player == "PRONE") then {
        LOG("moveUp from prone");
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
    };
}];

// (Z) Go Prone / Stand Up
addUserActionEventHandler ["MoveDown", "Activate", {
    if (!alive ACE_player || {!isNull objectParent ACE_player} || {!isNull curatorCamera}) exitWith {};

    private _launcherWeapon = secondaryWeapon ACE_player;

    if (_launcherWeapon == "" || {currentWeapon ACE_player != _launcherWeapon}) exitwith {};

    if (stance ACE_player == "PRONE") then {
        LOG("moveDown from prone");
        ACE_player playMoveNow "AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon";
        ACE_player playMove "AmovPknlMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon";
    } else {
        TRACE_1("moveDown from non-prone",stance ACE_player);
        ACE_player playMoveNow "ACE_LauncherProne";
    };
}];
