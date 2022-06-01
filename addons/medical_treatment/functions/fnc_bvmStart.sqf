#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles starting the BVM treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_bvmStart
 *
 * Public: No
 */

params ["_medic", "_patient","","_className"];
TRACE_2("bvmStart",_medic,_patient);

private _defaultConfig = configFile >> QUOTE(ADDON) >> "ManualBreathing";
private _adjunctConfig = _defaultConfig >> _classname;

private _level = GET_NUMBER(_adjunctConfig >> "airwayRecoveryLevel",getNumber (_defaultConfig >> "airwayRecoveryLevel"));
_patient setVariable [QEGVAR(medical,air_provider), _medic, true];
_patient setVariable [QEGVAR(medical,air_supliment), _level, true];
