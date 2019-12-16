#include "script_component.hpp"
/*
 * Author: Garth de Wet (LH)
 * Checks whether the passed unit is an explosive specialist.
 * Either through config entry: "canDeactivateMines"
 * or
 * unit setVariable ["ACE_isEOD", true]
 *
 * Arguments:
 * 0: Unit to check if is a specialist <OBJECT>
 *
 * Return Value:
 * is the unit an EOD <BOOL>
 *
 * Example:
 * [player] call ace_common_fnc_isEOD
 *
 * Public: Yes
 */

params ["_unit"];

(_unit getVariable ["ACE_isEOD", _unit getUnitTrait "explosiveSpecialist"]) in [1, true]
