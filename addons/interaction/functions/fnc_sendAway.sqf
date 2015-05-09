/*
 * Author: KoffeinFlummi
 * Sends a civilian crowd away with a chance of failure
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [target] call ace_interaction_fnc_sendAway
 *
 * Public: No
 */
#include "script_component.hpp"

#define DISTANCE 50
#define RADIUS 10

PARAMS_1(_unit);

private ["_chance", "_x"];

ACE_player playActionNow "GestureGo";

if (count weapons ACE_player > 0) then {
    _chance = 0.8;
} else {
    _chance = 0.5;
};

{
    if (count (weapons _unit) == 0 and random 1 < _chance) then {
        [-2, {
            (_this select 0) setUnitPos "AUTO";
            (_this select 0) doMove [(getPos (_this select 0) select 0) + DISTANCE * (eyeDirection (_this select 1) select 0), (getPos (_this select 0) select 1) + DISTANCE * (eyeDirection (_this select 1) select 1), 0];
        }, [_x, ACE_player]] call CBA_fnc_globalExecute;
    };
} forEach (_unit nearEntities ["Civilian", RADIUS]);
