#include "script_component.hpp"
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
 * [player, [[0.5, "#structural", 1.5]], "vehicleHit"] call ace_medical_damage_fnc_woundsHandlerVehiclehit
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];
TRACE_3("woundsHandlerVehicleHit",_unit,_allDamages,_typeOfDamage);

_allDamages sort false;
private _damageToApply = _allDamages select 0 select 0;

private _newDamages = [];

// randomize quantity and hitpoints
for "_i" from 1 to (round random [2, 3, 8]) do {
    // legs and body are more likely to be hit: they're typically in more cramped sections of the vehicle
    _newDamages pushBack [_damageToApply, selectRandomWeighted ["head", 2, "body", 3, "leftarm", 1, "rightarm", 1, "leftleg", 3, "rightleg", 3], _damageToApply];
};

TRACE_1("Vehicle explosion handled, passing damage", _newDamages);
[_unit, _newDamages, _typeOfDamage] //return
