/*
 * Author: Garth 'L-H' de Wet
 * Whether a unit can perform the defuse action
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Able to defuse <BOOL>
 *
 * Example:
 * if ([player] call ACE_Explosives_fnc_canDefuse) then {hint "Can Defuse";};
 *
 * Public: Yes
 */
#include "script_component.hpp"
private "_unit";
_unit = _this select 0;
if (vehicle _unit != _unit || {!("ACE_DefusalKit" in (items _unit))}) exitWith {false};
_isSpecialist = [_unit] call EFUNC(Common,isEOD);

if (GVAR(RequireSpecialist) && {!_isSpecialist}) exitWith {false};

_timeBombCore = nearestObject [_unit, "TimeBombCore"];
_mineBase = nearestObject [_unit, "MineBase"];

_distCore = _unit distance _timeBombCore;
_distBase = _unit distance _mineBase;
_distance = 10;
if (_distCore < _distBase) then {
  _distance = _distCore;
  EGVAR(interaction,Target) = _timeBombCore;
}else{
  _distance = _distBase;
  EGVAR(interaction,Target) = _mineBase;
};
if (isNil "_distance") exitWith {false};
_distance < 4
