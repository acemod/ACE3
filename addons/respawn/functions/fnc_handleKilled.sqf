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

PARAMS_1(_killedUnit);

// Saves the gear when the player! (and only him) is killed
if (ACE_player == _killedUnit) then {
    GVAR(unitGear) = [];

    if (GVAR(SavePreDeathGear)) then {
        GVAR(unitGear) = [_killedUnit] call EFUNC(common,getAllGear);
        GVAR(unitGear) append [currentWeapon _killedUnit, currentMuzzle _killedUnit, currentWeaponMode _killedUnit];
    };
};

if (missionNamespace getVariable [QGVAR(showFriendlyFireMessage), false]) then {
    [_this, QUOTE(DFUNC(showFriendlyFireMessage)), 2] call EFUNC(common,execRemoteFnc);
};
