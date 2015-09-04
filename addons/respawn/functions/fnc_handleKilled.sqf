/*
 * Author: bux578
 * Handles the XEH killed event.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 * 1: Attacker <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, bad_dude] call ace_respawn_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_killedUnit"];

// Saves the gear when the player! (and only him) is killed
if (ACE_player == _killedUnit) then {
    GVAR(unitGear) = [];

    if (GVAR(SavePreDeathGear)) then {
        GVAR(unitGear) = [_killedUnit] call EFUNC(common,getAllGear);
    };
};

if (missionNamespace getVariable [QGVAR(showFriendlyFireMessage), false]) then {
    [_this, QUOTE(DFUNC(showFriendlyFireMessage)), 2] call EFUNC(common,execRemoteFnc);
};
