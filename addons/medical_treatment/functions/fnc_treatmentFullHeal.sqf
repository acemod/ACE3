/*
 * Author: Glowbal
 * Full heal treatment
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 * 4: Item <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target"];

[QGVAR(treatmentFullHealLocal), [_caller, _target], _target] call CBA_fnc_targetEvent;

true
