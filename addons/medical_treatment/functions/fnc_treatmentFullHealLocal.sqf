#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles full heal of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

params ["_target"];

if (!alive _target) exitWith {};

// Treatment conditions would normally limit this to non-unconc units, but treatment event may be called externally (zeus)
if (_target getVariable [QEGVAR(medical,inCardiacArrest), false]) then {
    TRACE_1("exiting cardiac arrest",_target);
    [QEGVAR(medical,CPRSucceeded), _target] call CBA_fnc_localEvent;
};
if (_target getVariable ["ACE_isUnconscious",false]) then {
    TRACE_1("waking up",_target); // wake up first or unconc variables will be reset
    [QEGVAR(medical,WakeUp), _target] call CBA_fnc_localEvent;
};


_target setVariable [VAR_PAIN, 0, true];
_target setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];

// tourniquets
_target setVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES, true];
_target setVariable [QGVAR(occludedMedications), nil, true];

// wounds and injuries
_target setVariable [QEGVAR(medical,openWounds), [], true];
_target setVariable [QEGVAR(medical,bandagedWounds), [], true];
_target setVariable [QEGVAR(medical,stitchedWounds), [], true];
_target setVariable [QEGVAR(medical,isLimping), false, true];

// - Update wound bleeding
[_target] call EFUNC(medical_status,updateWoundBloodLoss);

// vitals
_target setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
_target setVariable [VAR_BLOOD_PRESS, [80, 120], true];
_target setVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES, true];

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
_target setVariable [VAR_IN_PAIN, false, true];
_target setVariable [VAR_PAIN_SUPP, 0, true];

// medication
_target setVariable [VAR_MEDICATIONS, [], true];

// Reset triage card since medication is all reset
_target setVariable [QEGVAR(medical,triageCard), [], true];

[_target, false] call EFUNC(medical_engine,setLimping);

// Resetting damage
_target setDamage 0;

[QEGVAR(medical,FullHeal), _target] call CBA_fnc_localEvent;
