/*
 * Author: KoffeinFlummi, commy2
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_init
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (damage _unit > 0) then {
    _unit setDamage 0;
};

// - Blood and heart ----------------------------------------------------------
_unit setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];
_unit setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
_unit setVariable [VAR_HEART_RATE_ADJ, [], true];
_unit setVariable [VAR_BLOOD_PRESS, [80, 120], true];
_unit setVariable [QGVAR(peripheralResistance), 100, true];
_unit setVariable [QGVAR(peripheralResistanceAdjustments), [], true];
_unit setVariable [VAR_CRDC_ARRST, false, true];
_unit setVariable [QGVAR(hasLostBlood), 0, true];
_unit setVariable [VAR_IS_BLEEDING, false, true];

// - Pain ---------------------------------------------------------------------
_unit setVariable [VAR_PAIN, 0, true];
_unit setVariable [VAR_IN_PAIN, false, true];
_unit setVariable [VAR_PAIN_SUPP, 0, true];
_unit setVariable [VAR_PAIN_SUPP_ADJ, [], true];

// - Wounds -------------------------------------------------------------------
_unit setVariable [QGVAR(openWounds), [], true];
_unit setVariable [QGVAR(bandagedWounds), [], true];
_unit setVariable [QGVAR(stitchedWounds), [], true];
_unit setVariable [QEGVAR(medical_engine,isLimping), false, true];

// - Misc ---------------------------------------------------------------------
_unit setVariable [VAR_UNCON, false, true];

// - Treatments ---------------------------------------------------------------
_unit setVariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];
_unit setVariable [QGVAR(occludedMedications), nil, true]; //Delayed Medications (from tourniquets)
_unit setVariable [QGVAR(ivBags), nil, true];
_unit setVariable [QGVAR(partialHealCounter), 0, true];

// triage card and logs
_unit setVariable [QGVAR(triageLevel), 0, true];
_unit setVariable [QGVAR(triageCard), [], true];

// damage storage
_unit setVariable [QGVAR(bodyPartDamage), [0,0,0,0,0,0], true];
#ifdef DEBUG_TESTRESULTS
_unit setVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];
#endif

// medication
private _allUsedMedication = _unit getVariable [QGVAR(allUsedMedication), []];
{
   _unit setVariable [_x select 0, nil];
} forEach _allUsedMedication;
_unit setVariable [QGVAR(allUsedMedication), [], true];

// TODO move to treatment
private _logs = _unit getVariable [QGVAR(allLogs), []];
{
    _unit setVariable [_x, nil];
} forEach _logs;
_unit setVariable [QGVAR(allLogs), [], true];

[{
    params ["_unit"];
    TRACE_2("Unit Init",_unit,local _unit);
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
