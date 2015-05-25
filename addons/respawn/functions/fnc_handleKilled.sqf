/*
  Name: ACE_Respawn_fnc_handleKilled

  Author(s):
    bux578

  Description:
    Handles the XEH Killed event

  Parameters:
    0: OBJECT - Killed unit
    1: OBJECT - Attacker

  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_killedUnit"];

_killedUnit = _this select 0;

// Saves the gear when the player is killed
GVAR(unitGear) = [];

if (GVAR(SavePreDeathGear)) then {
    GVAR(unitGear) = [_killedUnit] call EFUNC(common,getAllGear);
};

if (missionNamespace getVariable [QGVAR(showFriendlyFireMessage), false]) then {
    [_this, QUOTE(DFUNC(showFriendlyFireMessage)), 2] call EFUNC(common,execRemoteFnc);
};
