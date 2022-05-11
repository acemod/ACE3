#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Custom wound handler for collisions to reduce effectiveness of armor
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
 * [player, [[0.5, "body", 1.5]], "collision"] call ace_medical_damage_fnc_woundsHandlerVehicleCrash
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];

// partially ignore armor
private _newDamages = _allDamages apply {
    _x params ["_dmgAfter", "_part", "_dmgBefore"];
    [0.5*(_dmgBefore+_dmgAfter), _part, _dmgBefore];
};

TRACE_1("Collision handled, passing damage", _newDamages);
[_unit, _newDamages, _typeOfDamage] //return
