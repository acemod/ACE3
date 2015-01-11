/*
  Name: AGM_Explosives_fnc_StartDefuse
  
  Author: Garth de Wet (LH)
  
  Description:
    Starts defusing an explosive
  
  Parameters: 
    0: OBJECT - Unit to defuse explosive
    1: OBJECT - Target explosive
  
  Returns:
    Nothing
  
  Example:
    [player, AGM_Interaction_Target] call AGM_Explosives_fnc_StartDefuse;
*/
private ["_unit","_target"];
_unit = _this select 0;
_target = _this select 1;

// [_specialist, _target] call _fnc_DefuseTime;
_fnc_DefuseTime = {
  _target = _this select 1;
  
  _defuseTime = 5;
  if (isNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "AGM_DefuseTime")) then {
    _defuseTime = getNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "AGM_DefuseTime");
  };
  if (!(_this select 0) && {AGM_Explosives_PunishNonSpecialists}) then {
    _defuseTime = _defuseTime * 1.5;
  };
  _defuseTime
};
_actionToPlay = "MedicOther";
if (STANCE _unit == "Prone") then {
  _actionToPlay = "PutDown";
};

if (AGM_player != _unit) then {
  // If the unit is a player, call the function on the player.
  if (isPlayer _unit) then {
    [[_unit, _target], "AGM_Explosives_fnc_StartDefuse", _unit] call AGM_Core_fnc_execRemoteFnc;
  } else {
    [_unit, _target, [[_unit] call AGM_Core_fnc_isEOD, _target] call _fnc_DefuseTime] spawn {
      (_this select 0) playActionNow _actionToPlay;
      (_this select 0) disableAI "MOVE";
      (_this select 0) disableAI "TARGET";
      sleep (_this select 2);
      [(_this select 0), (_this select 1)] call AGM_Explosives_fnc_DefuseExplosive;
      (_this select 0) enableAI "MOVE";
      (_this select 0) enableAI "TARGET";
    };
  };
} else {
  _unit playActionNow _actionToPlay;
  if (AGM_Explosives_RequireSpecialist) then {
    if ([_unit] call AGM_Core_fnc_isEOD) then {
      [[true, _target] call _fnc_DefuseTime, [_unit,_target], "AGM_Explosives_fnc_DefuseExplosive", localize "STR_AGM_Explosives_DefusingExplosive"] call AGM_Core_fnc_progressBar;
    };
  } else {
    [[([_unit] call AGM_Core_fnc_isEOD), _target] call _fnc_DefuseTime, [_unit,_target], "AGM_Explosives_fnc_DefuseExplosive", localize "STR_AGM_Explosives_DefusingExplosive"] call AGM_Core_fnc_progressBar;
  };
};
