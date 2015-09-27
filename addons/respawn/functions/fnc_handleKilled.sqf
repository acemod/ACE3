/*
 * Author: bux578
 * Handles the XEH killed event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
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

params ["_unit"];

// Saves the gear when the player! (and only him) is killed
if (ACE_player == _unit) then {
    GVAR(unitGear) = [];

    if (GVAR(SavePreDeathGear)) then {
        GVAR(unitGear) = [_unit] call EFUNC(common,getAllGear);
        GVAR(unitGear) pushBack [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
    };
};

if (missionNamespace getVariable [QGVAR(showFriendlyFireMessage), false]) then {
    [_this, QUOTE(DFUNC(showFriendlyFireMessage)), 2] call EFUNC(common,execRemoteFnc);
};
