/*
 * Author: Garth 'L-H' de Wet
 * Starts defusing an explosive
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target explosive <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, ACE_Interaction_Target] call ACE_Explosives_fnc_StartDefuse;
 *
 * Public: Yes
 */
#include "script_component.hpp"
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
    [[_unit, _target], QFUNC(startDefuse), _unit] call EFUNC(common,execRemoteFnc);
  } else {
    // TODO: use scheduled delay execution
    [_unit, _target, [[_unit] call EFUNC(Common,isEOD), _target] call _fnc_DefuseTime] spawn {
      (_this select 0) playActionNow _actionToPlay;
      (_this select 0) disableAI "MOVE";
      (_this select 0) disableAI "TARGET";
      sleep (_this select 2);
      [(_this select 0), (_this select 1)] call FUNC(defuseExplosive);
      (_this select 0) enableAI "MOVE";
      (_this select 0) enableAI "TARGET";
    };
  };
} else {
  _unit playActionNow _actionToPlay;
  private ["_defuseSeconds", "_isEOD"];
  _isEOD = [_unit] call EFUNC(Common,isEOD);
  _defuseSeconds = [_isEOD, _target] call _fnc_DefuseTime;
  if (_isEOD || {!GVAR(RequireSpecialist)}) then {
    [_defuseSeconds, [_unit,_target], {(_this select 0) call FUNC(defuseExplosive)}, {}, (localize "STR_ACE_Explosives_DefusingExplosive")] call EFUNC(common,progressBar);
  };
};
