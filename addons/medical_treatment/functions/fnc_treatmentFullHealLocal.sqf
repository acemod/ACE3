/*
 * Author: Glowbal
 * Handles full heal of a patient.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target"];

if (!alive _target) exitWith {};

_unit setVariable [VAR_PAIN, 0, true];
_unit setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];

// tourniquets
_target setVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0], true];
_target setVariable [QGVAR(occludedMedications), nil, true];

// wounds and injuries
_target setVariable [QEGVAR(medical,openWounds), [], true];
_target setVariable [QEGVAR(medical,bandagedWounds), [], true];
_target setVariable [QEGVAR(medical,stitchedWounds), [], true];
_target setVariable [QEGVAR(medical,isLimping), false, true];

// vitals
_target setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
_target setVariable [VAR_HEART_RATE_ADJ, [], true];
_target setVariable [VAR_BLOOD_PRESS, [80, 120], true];
_target setVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES, true];
_target setVariable [VAR_PERIPH_RES_ADJ, [], true];

// IVs
_target setVariable [QEGVAR(medical,ivBags), nil, true];

// damage storage
_target setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];
#ifdef DEBUG_TESTRESULTS
_target setVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0], true];
#endif

// generic medical admin
_target setVariable [VAR_CRDC_ARRST, false, true];
_target setVariable [VAR_UNCON, false, true];
_target setVariable [VAR_HEMORRHAGE, 0, true];
_target setVariable [VAR_IS_BLEEDING, false, true];
_target setVariable [VAR_IN_PAIN, false, true];
_target setVariable [VAR_PAIN_SUPP, 0, true];
_target setVariable [VAR_PAIN_SUPP_ADJ, [], true];

// medication
private _allUsedMedication = _target getVariable [QEGVAR(medical,allUsedMedication), []];

{
   _target setVariable [_x select 0, nil];
} forEach _allUsedMedication;

// Reset triage card since medication is all reset
_target setVariable [QEGVAR(medical,triageCard), [], true];

[_target, false] call EFUNC(medical_engine,setLimping);

// Resetting damage
_target setDamage 0;

[QEGVAR(medical,FullHeal), _target] call CBA_fnc_localEvent;

[_target, "activity", ELSTRING(medical_treatment,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical_treatment,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
