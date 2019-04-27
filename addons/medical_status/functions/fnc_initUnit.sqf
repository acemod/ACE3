#include "script_component.hpp"
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
 * [bob] call ace_medical_status_fnc_init
 *
 * Public: No
 */

params ["_unit"];

if (!local _unit) exitWith {};

if (damage _unit > 0) then {
    _unit setDamage 0;
};

// - Blood and heart ----------------------------------------------------------
_unit setVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME, true];
_unit setVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE, true];
_unit setVariable [VAR_BLOOD_PRESS, [80, 120], true];
_unit setVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES, true];
_unit setVariable [VAR_CRDC_ARRST, false, true];
_unit setVariable [VAR_HEMORRHAGE, 0, true];

// - Pain ---------------------------------------------------------------------
_unit setVariable [VAR_PAIN, 0, true];
_unit setVariable [VAR_IN_PAIN, false, true];
_unit setVariable [VAR_PAIN_SUPP, 0, true];

// - Wounds -------------------------------------------------------------------
_unit setVariable [QEGVAR(medical,openWounds), [], true];
_unit setVariable [QEGVAR(medical,bandagedWounds), [], true];
_unit setVariable [QEGVAR(medical,stitchedWounds), [], true];
_unit setVariable [QEGVAR(medical,isLimping), false, true];

// - Misc ---------------------------------------------------------------------
_unit setVariable [VAR_UNCON, false, true];

// - Treatments ---------------------------------------------------------------
_unit setVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES, true];
_unit setVariable [QEGVAR(medical,occludedMedications), nil, true]; //Delayed Medications (from tourniquets)
_unit setVariable [QEGVAR(medical,ivBags), nil, true];

// - Update wound bleeding
[_unit] call EFUNC(medical_status,updateWoundBloodLoss);

// triage card and logs
_unit setVariable [QEGVAR(medical,triageLevel), 0, true];
_unit setVariable [QEGVAR(medical,triageCard), [], true];

// damage storage
_unit setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];
#ifdef DEBUG_TESTRESULTS
_unit setVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0], true];
#endif

// medication
_unit setVariable [VAR_MEDICATIONS, [], true];

// TODO move to treatment
private _logs = _unit getVariable [QEGVAR(medical,allLogs), []];
{
    _unit setVariable [_x, nil];
} forEach _logs;
_unit setVariable [QEGVAR(medical,allLogs), [], true];

[{
    params ["_unit"];
    TRACE_2("Unit Init",_unit,local _unit);
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
