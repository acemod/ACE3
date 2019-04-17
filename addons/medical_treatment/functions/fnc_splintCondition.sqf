#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Can apply a splint to the patient
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
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_splintCondition
 *
 * Public: No
 */

params ["", "_target", "_bodyPart"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
private _fractures = _unit getVariable [QEGVAR(medical,fractures), [0,0,0,0,0,0]];

(_fractures select _partIndex) == 1
