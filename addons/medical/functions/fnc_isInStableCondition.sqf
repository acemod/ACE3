#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit is in stable condition (stable vitals, awake, and not bleeding). 
 * Unit shouldn't require further treatment if true and not injured.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is unit stable <BOOL>
 *
 * Example:
 * player call ace_medical_fnc_isInStableCondition
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!alive _unit) exitWith { false };

_unit call EFUNC(medical_status,isInStableCondition)
