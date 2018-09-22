#include "script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Callback when the bloodbag treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "selection", "classname"] call ACE_medical_fnc_treatmentBasic_bloodbag
 *
 * Public: No
 */

params ["_caller", "_target", "_treatmentClassname"];

if (local _target) then {
    [QGVAR(treatmentBasic_bloodbagLocal), [_target, _treatmentClassname]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentBasic_bloodbagLocal), [_target, _treatmentClassname], _target] call CBA_fnc_targetEvent;
};
