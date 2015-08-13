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

private ["_chance", "_x"];

params ["_unit"];

ACE_player playActionNow "GestureGo";

if (count weapons ACE_player > 0) then {
    _chance = 0.8;
} else {
    _chance = 0.5;
};

{
    if (count (weapons _unit) == 0 and random 1 < _chance) then {
        [-2, {
            params ["_unit", "_player"]
            _unit setUnitPos "AUTO";
            _unit doMove [(getPos _unit select 0) + DISTANCE * (eyeDirection _player select 0), (getPos _unit select 1) + DISTANCE * (eyeDirection _player select 1), 0];
        }, [_x, ACE_player]] call CBA_fnc_globalExecute;
    };
    true
} count (_unit nearEntities ["Civilian", RADIUS]);
