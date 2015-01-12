/*
  Name: ACE_Explosives_fnc_StartDefuse

  Author: Garth de Wet (LH)

  Description:
    Starts defusing an explosive

  Parameters:
    0: OBJECT - Unit to defuse explosive
    1: OBJECT - Target explosive

  Returns:
    Nothing

  Example:
    [player, ACE_Interaction_Target] call ACE_Explosives_fnc_StartDefuse;
*/
#include "\z\ace\explosives\script_component.hpp"
private ["_unit","_target"];
_unit = _this select 0;
_target = _this select 1;

_fnc_DefuseTime = {
  _target = _this select 1;

  _defuseTime = 5;
  if (isNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "ACE_DefuseTime")) then {
    _defuseTime = getNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "ACE_DefuseTime");
  };
  if (!(_this select 0) && {GVAR(PunishNonSpecialists)}) then {
    _defuseTime = _defuseTime * 1.5;
  };
  _defuseTime
};
_actionToPlay = "MedicOther";
if (STANCE _unit == "Prone") then {
  _actionToPlay = "PutDown";
};

if (ACE_player != _unit) then {
  // If the unit is a player, call the function on the player.
  if (isPlayer _unit) then {
    [[_unit, _target], QUOTE(FUNC(startDefuse)), _unit] call EFUNC(Core,execRemoteFnc);
  } else {
    // TODO: use scheduled delay execution
    [_unit, _target, [[_unit] call EFUNC(Core,isEOD), _target] call _fnc_DefuseTime] spawn {
      (_this select 0) playActionNow _actionToPlay;
      (_this select 0) disableAI "MOVE";
      (_this select 0) disableAI "TARGET";
      sleep (_this select 2);
      [(_this select 0), (_this select 1)] call Func(defuseExplosive);
      (_this select 0) enableAI "MOVE";
      (_this select 0) enableAI "TARGET";
    };
  };
} else {
  _unit playActionNow _actionToPlay;
  if (GVAR(RequireSpecialist)) then {
    if ([_unit] call EFUNC(Core,isEOD)) then {
      [[true, _target] call _fnc_DefuseTime, [_unit,_target],
        QUOTE(FUNC(defuseExplosive)), localize "STR_ACE_Explosives_DefusingExplosive"] call EFUNC(Core,progressBar);
    };
  } else {
    [[([_unit] call EFUNC(Core,isEOD)), _target] call _fnc_DefuseTime, [_unit,_target],
    QUOTE(FUNC(defuseExplosive)), localize "STR_ACE_Explosives_DefusingExplosive"] call EFUNC(Core,progressBar);
  };
};
