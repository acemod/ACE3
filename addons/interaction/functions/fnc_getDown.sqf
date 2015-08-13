/*
 * Author: KoffeinFlummi
 * Forces a civilian to the ground (with a chance of failure)
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [target] call ace_interaction_fnc_getDown
 *
 * Public: No
 */
#include "script_component.hpp"

#define RADIUS 10

private ["_chance", "_x"];
params ["_unit"];

ACE_player playActionNow "GestureGo"; // put something else here.

if (count (weapons ACE_player) > 0) then {
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
  true
} count (_unit nearEntities ["Civilian", RADIUS]);
