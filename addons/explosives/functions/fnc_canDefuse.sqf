/*
  Name: ACE_Explosives_fnc_canDefuse

  Author: Garth de Wet (LH)

  Description:
    Checks if a unit can defuse an explosive

  Parameters:
    0: OBJECT - unit

  Returns:
    Nothing

  Example:
    [player] call ACE_Explosives_fnc_CanDefuse;
*/
#include "script_component.hpp"
private "_unit";
_unit = _this select 0;
if (vehicle _unit != _unit || {!("ACE_DefusalKit" in (items _unit))}) exitWith {false};
_isSpecialist = [_unit] call EFUNC(Core,isEOD);

if (GVAR(RequireSpecialist) && {!_isSpecialist}) exitWith {false};

_timeBombCore = nearestObject [_unit, "TimeBombCore"];
_mineBase =  nearestObject [_unit, "MineBase"];

_distCore = _unit distance _timeBombCore;
_distBase = _unit distance _mineBase;
_distance = 10;
if (_distCore < _distBase) then {
  _distance = _distCore;
  EGVAR(Interaction,Target) = _timeBombCore;
}else{
  _distance = _distBase;
  EGVAR(Interaction,Target) = _mineBase;
};
if (isNil "_distance") exitWith {false};
_distance < 4
