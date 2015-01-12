/*
  Name: AGM_Respawn_fnc_handleKilled
  
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

private ["_killedUnit"];

_killedUnit = _this select 0;

// Saves the gear when the player is killed
AGM_Respawn_unitGear = [];

if (AGM_Respawn_SavePreDeathGear) then {
  AGM_Respawn_unitGear = [_killedUnit] call AGM_Respawn_fnc_getAllGear;
};

if (missionNamespace getVariable ["AGM_showFriendlyFireMessage", false]) then {
  [_this, "AGM_Respawn_fnc_showFriendlyFireMessage", 2] call AGM_Core_fnc_execRemoteFnc;
};
