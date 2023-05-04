#include "script_component.hpp"
/*
 * Author: Slatery
 * Local callback for inserting an airway adjunct to a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Treatment <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "ACE_advancedAirway"] call ace_medical_treatment_fnc_aiwayAdjunctLocal;
 *
 * Public: No
 */

params ["_medic", "_patient","_classname"];
TRACE_2("aiwayAdjunctLocal",_medic,_patient);

private _defaultConfig = configFile >> QUOTE(ADDON) >> "AirwayAdjunct";
private _adjunctConfig = _defaultConfig >> _classname;

private _level = GET_NUMBER(_adjunctConfig >> "airwayRecoveryLevel",getNumber (_defaultConfig >> "airwayRecoveryLevel"));
_patient setVariable [VAR_AIRWAY_TREATMENT_LVL, _level, true];
_patient setVariable [VAR_AIRWAY_COLLAPSED, false, true];
