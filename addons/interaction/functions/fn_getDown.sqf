/*
 * Author: KoffeinFlummi
 * 
 * Forces a civilian to the ground. (chance of failure).
 * 
 * Arguments:
 * 0: Unit to be sent away (Object)
 *
 * Return value:
 * none
 */

#define RADIUS 10

private ["_unit", "_chance", "_x"];

_unit = _this select 0;

AGM_player playActionNow "GestureGo"; // put something else here.

if (count (weapons AGM_player) > 0) then {
  _chance = 0.8;
} else {
  _chance = 0.5;
};

{
  if (count (weapons _unit) == 0 and random 1 < _chance) then {
    [-2, {
      _this setUnitPos "DOWN";
    }, _x] call CBA_fnc_globalExecute;
  };
} foreach (_unit nearEntities ["Civilian", RADIUS]);
