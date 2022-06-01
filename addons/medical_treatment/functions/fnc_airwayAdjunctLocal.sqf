#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Local callback for applying a splint to a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_splintLocal
 *
 * Public: No
 */

params ["_medic", "_patient","_classname"];
TRACE_2("chestSealLocal",_medic,_patient);

private _defaultConfig = configFile >> QUOTE(ADDON) >> "AirwayAdjunct";
private _adjunctConfig = _defaultConfig >> _classname;

private _level = GET_NUMBER(_adjunctConfig >> "airwayRecoveryLevel",getNumber (_defaultConfig >> "airwayRecoveryLevel"));
_patient setVariable [VAR_AIRWAY_TREATMENT_LVL, _level, true];
_patient setVariable [VAR_AIRWAY_COLLAPSED, false, true];
