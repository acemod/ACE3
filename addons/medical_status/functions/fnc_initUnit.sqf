/*
 * Author: KoffeinFlummi, commy2
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (damage _unit > 0) then {
    _unit setDamage 0;
};

// - Blood and heart ----------------------------------------------------------
_unit setVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME, true];
_unit setVariable [QGVAR(heartRate), DEFAULT_HEART_RATE, true];
_unit setVariable [QGVAR(heartRateAdjustments), [], true];
_unit setVariable [QGVAR(bloodPressure), [80, 120], true];
_unit setVariable [QGVAR(peripheralResistance), 100, true];
_unit setVariable [QGVAR(peripheralResistanceAdjustments), [], true];
_unit setVariable [QGVAR(inCardiacArrest), false, true];
_unit setVariable [QGVAR(hasLostBlood), 0, true];
_unit setVariable [QGVAR(isBleeding), false, true];

// - Pain ---------------------------------------------------------------------
_unit setVariable [QGVAR(pain), 0, true];
_unit setVariable [QGVAR(hasPain), false, true];
_unit setVariable [QGVAR(painSuppress), 0, true];
_unit setVariable [QGVAR(painSuppressAdjustments), [], true];

// - Wounds -------------------------------------------------------------------
_unit setVariable [QGVAR(openWounds), [], true];
_unit setVariable [QGVAR(bandagedWounds), [], true];
_unit setVariable [QGVAR(stitchedWounds), [], true];

// - Misc ---------------------------------------------------------------------
_unit setVariable [QGVAR(isUnconscious), false, true];

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

// generic medical admin
private ["_allUsedMedication", "_logs"];

// medication
_allUsedMedication = _unit getVariable [QGVAR(allUsedMedication), []];
{
   _unit setVariable [_x select 0, nil];
} forEach _allUsedMedication;
_unit setVariable [QGVAR(allUsedMedication), [], true];

// TODO move to treatment
_logs = _unit getVariable [QGVAR(allLogs), []];
{
    _unit setVariable [_x, nil];
} forEach _logs;
_unit setVariable [QGVAR(allLogs), [], true];

[{
    params ["_unit"];
    TRACE_2("Unit Init",_unit,local _unit);
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
