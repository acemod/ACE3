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
 * [player] call ace_medical_engine_fnc_conditionIsConsideredPlayer
 *
 * Public: No
 */

params ["_unit"];

isPlayer _unit || {
	// check if unit medical settings are overriden via eden atribute
	switch (_unit getVariable [QEGVAR(medical,OverrideAIMedicalSettings), 0]) do {
		case 0: {
			// no override, check mission settings
			switch (EGVAR(medical,considerSelectAIPlayersForMedical)) do {
				case 0: {false};
				case 1: { 
					if (isMultiplayer) then {
						_unit in playableUnits // return
					} else {
						_unit in switchableUnits // return
					};
				};
				case 2: { 
					_unit in units ACE_player // return
				};
				default {false}; // failsafe, just in case
			};
		};
		case 1: {true};
		case 2: {false};
	};
}
