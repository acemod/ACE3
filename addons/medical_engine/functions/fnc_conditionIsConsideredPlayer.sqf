#include "script_component.hpp"
/*
 * Author: RusComBear
 * Condition for unit to be considered player for medical system
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_conditionIsConsideredPlayer
 *
 * Public: No
 */

params ["_unit"];

if (isPlayer _unit) then {
    true
} else {
    switch (EGVAR(medical,considerSelectAIPlayersForMedical)) do {
	    case 0: {false};
	    case 1: { 
            if (isMultiplayer) then {
                [false, true] select (_unit in playableUnits);
            } else {
                [false, true] select (_unit in switchableUnits);
            };
        };
	    case 2: { 
            [false, true] select (_unit in units ACE_player);
        };
	    default {false}; //Default code should never be entered, but just in case
    };
}
