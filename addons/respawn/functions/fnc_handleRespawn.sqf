#include "script_component.hpp"
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

params ["_unit"];

// Restores the gear when the player respawns
if (GVAR(SavePreDeathGear)) then {
    [
        _unit,
        _unit getVariable QGVAR(unitGear),
        _unit getVariable QGVAR(activeWeaponAndMuzzle)
    ] call FUNC(restoreGear);
};

// fix for setVariable public being lost on respawn for machines that JIP after the command was broadcasted
if (_unit getVariable ["ACE_canMoveRallypoint", false]) then {
    _unit setVariable ["ACE_canMoveRallypoint", true, true];
};
