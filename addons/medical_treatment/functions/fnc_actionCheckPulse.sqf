#include "script_component.hpp"
/*
 * Author: Glowbal
 * Action for checking the pulse or heart rate of the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_caller", "_target", "_bodyPart"];

[QGVAR(actionCheckPulseLocal), [_caller, _target, _bodyPart], _target] call CBA_fnc_targetEvent;

true
