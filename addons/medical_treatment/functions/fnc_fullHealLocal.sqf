#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for fully healing a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_fullHealLocal
 *
 * Public: No
 */

params ["_patient"];

if (!alive _patient) exitWith {};

// Treatment conditions would normally limit full heal to non-unconscious units
// However, this may be called externally (through Zeus)
if IN_CRDC_ARRST(_patient) then {
    TRACE_1("Exiting cardiac arrest",_patient);
    [QEGVAR(medical,CPRSucceeded), _patient] call CBA_fnc_localEvent;
};

if IS_UNCONSCIOUS(_patient) then {
    TRACE_1("Waking up",_patient);
    // Wake patient up first or unconscious variables will be reset
    [QEGVAR(medical,WakeUp), _patient] call CBA_fnc_localEvent;
};

_patient setVariable [VAR_PAIN, 0, true];
_patient setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];

// Tourniquets
_patient setVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES, true];
_patient setVariable [QGVAR(occludedMedications), nil, true];

// Wounds and Injuries
_patient setVariable [QEGVAR(medical,openWounds), [], true];
_patient setVariable [QEGVAR(medical,bandagedWounds), [], true];
_patient setVariable [QEGVAR(medical,stitchedWounds), [], true];
_patient setVariable [QEGVAR(medical,isLimping), false, true];
_patient setVariable [QEGVAR(medical,fractures), [0,0,0,0,0,0], true];

// Update wound bleeding
[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

// Vitals
_patient setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
_patient setVariable [VAR_BLOOD_PRESS, [80, 120], true];
_patient setVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES, true];

// IVs
_patient setVariable [QEGVAR(medical,ivBags), nil, true];

// Damage storage
_patient setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];
#ifdef DEBUG_TESTRESULTS
_patient setVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0], true];
#endif

// Generic medical admin
_patient setVariable [VAR_CRDC_ARRST, false, true];
_patient setVariable [VAR_UNCON, false, true];
_patient setVariable [VAR_HEMORRHAGE, 0, true];
_patient setVariable [VAR_IN_PAIN, false, true];
_patient setVariable [VAR_PAIN_SUPP, 0, true];

// Medication
_patient setVariable [VAR_MEDICATIONS, [], true];

// Reset triage card since medication is reset
_patient setVariable [QEGVAR(medical,triageCard), [], true];

[_patient] call EFUNC(medical_engine,updateDamageEffects);

// Reset damage
_patient setDamage 0;

[QEGVAR(medical,FullHeal), _patient] call CBA_fnc_localEvent;
