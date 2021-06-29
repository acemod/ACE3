#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Custom wound handler for vehicle crashes, sends damage to a random hitpoint
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "#structural", 1.5]], "vehicleCrash"] call ace_medical_damage_fnc_woundsHandlerVehicleCrash
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];

// randomise all hit selections
private _newDamages = _allDamages apply {
	[_x select 0, selectRandom ALL_HITPOINTS, _x select 2];
};

[_unit, _newDamages, _typeOfDamage] call FUNC(defaultWoundHandler);