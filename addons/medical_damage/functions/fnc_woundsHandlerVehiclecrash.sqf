#include "..\script_component.hpp"
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
TRACE_3("woundsHandlerVehicleCrash",_unit,_allDamages,_typeOfDamage);

// randomise all hit selections
private _newDamages = _allDamages apply {
    [_x select 0, selectRandom ALL_BODY_PARTS, _x select 2];
};

TRACE_1("Vehicle crash handled, passing damage",_newDamages);
[_unit, _newDamages, _typeOfDamage] //return
