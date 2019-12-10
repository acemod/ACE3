#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the given unit is bleeding. Handles both ACE Medical and Vanilla.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is Bleeding <BOOL>
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
