/*
  Name: AGM_Explosives_fnc_CanDefuse
  
  Author: Garth de Wet (LH)
  
  Description:
    Checks if a unit can defuse an explosive
  
  Parameters: 
    0: OBJECT - unit
  
  Returns:
    Nothing
  
  Example:
    [player] call AGM_Explosives_fnc_CanDefuse;
*/
private "_unit";
_unit = _this select 0;
if (vehicle _unit != _unit || {!("AGM_DefusalKit" in (items _unit))}) exitWith {false};
_isSpecialist = ([_unit] call AGM_Core_fnc_isEOD);

if (AGM_Explosives_RequireSpecialist && {!_isSpecialist}) exitWith {false};

_timeBombCore = nearestObject [_unit, "TimeBombCore"];
_mineBase =  nearestObject [_unit, "MineBase"];

_distCore = _unit distance _timeBombCore;
_distBase = _unit distance _mineBase;
_distance = 10;
if (_distCore < _distBase) then {
  _distance = _distCore;
  AGM_Interaction_Target = _timeBombCore;
}else{
  _distance = _distBase;
  AGM_Interaction_Target = _mineBase; 
};
if (isNil "_distance") exitWith {false};
_distance < 4
