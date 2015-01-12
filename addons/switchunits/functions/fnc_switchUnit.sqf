/*
  Name: AGM_SwitchUnits_fnc_switchUnit
  
  Author(s):
    bux578
  
  Description:
    Selects the new given player unit
  
  Parameters:
    0: OBJECT - the unit to switch to
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_newUnit"];

_newUnit = _this select 1;

// don't switch to original player units
if (!([_newUnit] call FUNC(isValidAi))) exitWith {};

_newUnit spawn {
  private ["_unit", "_allNearestPlayers", "_oldUnit", "_respawnEhId", "_oldOwner", "_leave"];
  
  _unit = _this;
  
  _leave = false;
  
  if (GVAR(EnableSafeZone)) then {
  
    _allNearestPlayers = [position _unit, GVAR(SafeZoneRadius)] call FUNC(nearestPlayers);
    _nearestEnemyPlayers = [_allNearestPlayers, {((side GVAR(OriginalGroup)) getFriend (side _this) < 0.6) && !(_this getVariable [QGVAR(IsPlayerControlled), false])}] call EFUNC(Core, filter);
          
    if (count _nearestEnemyPlayers > 0) exitWith {
      _leave = true;
    };
  };
  
  // exitWith doesn't exit past the "if(EnableSafeZone)" block
  if (_leave) exitWith {
    [localize "STR_ACE_SwitchUnits_TooCloseToEnemy"] call EFUNC(Core, displayTextStructured);
  };
  
  // should switch locality
  // This doesn't work anymore, because one's now able to switch to units from a different side
  //[_unit] joinSilent group player;
  [[_unit, player], QUOTE({(_this select 0) setVariable [QGVAR(OriginalOwner), owner (_this select 0), true]; (_this select 0) setOwner owner (_this select 1)}), 1] call EFUNC(Core, execRemoteFnc);
  
  _oldUnit = player;
  waitUntil {sleep 0.2; local _unit};
  
  _oldUnit setVariable [QGVAR(IsPlayerControlled), false, true];
  _oldUnit setVariable [QGVAR(PlayerControlledName), "", true];
  
  _respawnEhId = _unit getVariable [QGVAR(RespawnEhId), -1];
  if (_respawnEhId != -1) then {
    _oldUnit removeEventHandler ["Respawn", _respawnEhId];
  };
  
  selectPlayer _unit;
  
  _unit setVariable [QGVAR(IsPlayerControlled), true, true];
  _unit setVariable [QGVAR(PlayerControlledName), GVAR(OriginalName), true];
  
  _respawnEhId = _unit addEventHandler ["Respawn", {
    [GVAR(OriginalUnit), _this select 0] spawn FUNC(switchBack);
  }];
  _unit setVariable [QGVAR(RespawnEhId), _respawnEhId, true];
  
  // set owner back to original owner
  _oldOwner = _oldUnit getVariable[QGVAR(OriginalOwner), -1];
  if (_oldOwner > -1) then {
    [[_oldUnit, _oldOwner], QUOTE({(_this select 0) setOwner (_this select 1)}), 1] call EFUNC(Core, execRemoteFnc);
  };
  
  [localize "STR_ACE_SwitchUnits_SwitchedUnit"] call EFUNC(Core, displayTextStructured);
};
