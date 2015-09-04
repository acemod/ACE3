/*
 * Author: bux578
 * Handles the XEH Respawn event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, old_body_lying_on_floor] call ace_respawn_fnc_handleRespawn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_respawnedUnit"];

// Restores the gear when the player respawns
if (GVAR(SavePreDeathGear)) then {
    [_respawnedUnit, GVAR(unitGear)] call FUNC(restoreGear);
};

// fix for setVariable public being lost on respawn for machines that JIP after the command was broadcasted
if (_respawnedUnit getVariable ["ACE_canMoveRallypoint", false]) then {
    _respawnedUnit setVariable ["ACE_canMoveRallypoint", true, true];
};
