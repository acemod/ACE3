#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Apply a splint to the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_splint
 *
 * Public: No
 */

params ["_caller", "_target", "_bodyPart"];
TRACE_3("splint",_caller,_target,_bodyPart);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

[QGVAR(splintLocal), [_caller, _target, _partIndex], _target] call CBA_fnc_targetEvent;
