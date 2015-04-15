/*
  Name: ACE_Respawn_fnc_handleRespawn
  
  Author(s):
    bux578
  
  Description:
    Handles the XEH Respawn event
  
  Parameters:
    0: OBJECT - Respawned Unit
    1: ?
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_respawnedUnit"];

_respawnedUnit = _this select 0;

// Restores the gear when the player respawns
if (GVAR(SavePreDeathGear)) then {
    [_respawnedUnit, GVAR(unitGear)] call FUNC(restoreGear);
};

// fix for setVariable public being lost on respawn for machines that JIP after the command was broadcasted
if (_respawnedUnit getVariable ["ACE_canMoveRallypoint", false]) then {
    _respawnedUnit setVariable ["ACE_canMoveRallypoint", true, true];
};
