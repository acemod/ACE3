/*
 * Author: KoffeinFlummi
 * 
 * Sends a civilian crowd away (chance of failure).
 * 
 * Arguments:
 * 0: Unit to be sent away (Object)
 *
 * Return value:
 * none
*/

#define DISTANCE 50
#define RADIUS 10

private ["_unit", "_chance", "_x"];

_unit = _this select 0;

AGM_player playActionNow "GestureGo";

if (count weapons AGM_player > 0) then {
  _chance = 0.8;
} else {
  _chance = 0.5;
};

{
  if (count (weapons _unit) == 0 and random 1 < _chance) then {
    [-2, {
      (_this select 0) setUnitPos "AUTO";
      (_this select 0) doMove [(getPos (_this select 0) select 0) + DISTANCE * (eyeDirection (_this select 1) select 0), (getPos (_this select 0) select 1) + DISTANCE * (eyeDirection (_this select 1) select 1), 0];
    }, [_x, AGM_player]] call CBA_fnc_globalExecute;
  };
} foreach (_unit nearEntities ["Civilian", RADIUS]);
