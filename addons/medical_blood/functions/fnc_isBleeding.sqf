#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if is bleeding
 *
 * Arguments:
 * 0: unit <TYPE>
 *
 * Return Value:
 * is Bleeding <BOOL>
 *
 * Example:
 * [player] call ace_medical_blood_fnc_isBleeding
 *
 * Public: No
 */

params ["_unit"];

if (GVAR(useAceMedical)) exitWith {
    IS_BLEEDING(_unit);
};

alive _unit && {getDammage _unit > 0.3}
