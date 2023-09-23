#include "..\script_component.hpp"
/*
 * Author: Pterolatypus, LinkIsGrim
 * Custom wound handler for vehicle hits and explosions, sends damage to a random hitpoint
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
 * [player, [[0.5, "#structural", 1.5]], "vehiclehit"] call ace_medical_damage_fnc_woundsHandlerVehiclehit
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];
TRACE_3("woundsHandlerVehiclehit",_unit,_allDamages,_typeOfDamage);

// this should only trigger for hits to just structural
if (count _allDamages > 1) exitWith {_this};

// damage can sometimes be negative (why?)
// damage to structural is low unless it's a very large explosion, in which case it is typically >= 1
private _damageToApply = (abs (_allDamages select 0 select 0));

private _newDamages = [];

// hitpoints are randomized, more damage means more wounds in different body parts
for "_i" from 1 to (_damageToApply * 6) do {
    _newDamages pushBack [_damageToApply, selectRandom ALL_BODY_PARTS, _damageToApply]
};

TRACE_1("Vehicle explosion handled, passing damage", _newDamages);
[_unit, _newDamages, _typeOfDamage] //return
