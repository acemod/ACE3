#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Apply a splint to the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part index <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, 4] call ace_medical_treatment_fnc_splintLocal
 *
 * Public: No
 */

params ["_caller", "_target", "_bodyPartNum"];
TRACE_3("splintLocal",_caller,_target,_bodyPart);

// Place a tourniquet on the bodypart
private _fractures = _target getVariable [QEGVAR(medical,fractures), [0,0,0,0,0,0]];
_fractures set [_bodyPartNum, -1];
_target setVariable [QEGVAR(medical,fractures), _fractures, true];

// Check if we fixed limping from this treatment
[_target] call EFUNC(medical_engine,setLimping);

// toDo: AddToLog:
