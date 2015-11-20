/*
 * Author: KoffeinFlummi
 * Callback when the bandaging treatment is complete
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
 * Public: No
 */

#include "script_component.hpp"

private ["_hitSelections", "_hitPoints", "_point", "_damage"];
params ["_caller", "_target", "_selection", "_className"];

[[_target, _selection], QUOTE(DFUNC(treatment_BiofoamLocal)), _target] call EFUNC(common,execRemoteFnc);