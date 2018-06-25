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
 * [bob] call ACE_medical_fnc_init
 *
 * Public: No
 */

params ["_unit"];

// basic
_unit setVariable [QGVAR(pain), 0, true];
_unit setVariable [QGVAR(morphine), 0, true];
_unit setVariable [QGVAR(bloodVolume), 100, true];
_unit setVariable ["ACE_isUnconscious", false, true];

// advanced
// tourniquets
_unit setVariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];

//Delayed Medications (from tourniquets)
_unit setVariable [QGVAR(occludedMedications), nil, true];

// wounds and injuries
_unit setVariable [QGVAR(openWounds), [], true];
_unit setVariable [QGVAR(bandagedWounds), [], true];
_unit setVariable [QGVAR(internalWounds), [], true];
_unit setVariable [QGVAR(lastUniqueWoundID), 1, true];

// vitals
_unit setVariable [QGVAR(heartRate), 80];
_unit setVariable [QGVAR(heartRateAdjustments), []];
_unit setVariable [QGVAR(bloodPressure), [80, 120]];
_unit setVariable [QGVAR(peripheralResistance), 100];

// fractures
_unit setVariable [QGVAR(fractures), [], true];

// triage card and logs
_unit setVariable [QGVAR(triageLevel), 0, true];
_unit setVariable [QGVAR(triageCard), [], true];

// IVs
_unit setVariable [QGVAR(ivBags), nil, true];

// damage storage
_unit setVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

// airway
_unit setVariable [QGVAR(airwayStatus), 100];
_unit setVariable [QGVAR(airwayOccluded), false];
_unit setVariable [QGVAR(airwayCollapsed), false];

// generic medical admin
_unit setVariable [QGVAR(addedToUnitLoop), false, true];
_unit setVariable [QGVAR(inCardiacArrest), false, true];
_unit setVariable [QGVAR(hasLostBlood), 0, true];
_unit setVariable [QGVAR(isBleeding), false, true];
_unit setVariable [QGVAR(hasPain), false, true];
_unit setVariable [QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives), true];
_unit setVariable [QGVAR(painSuppress), 0, true];

// medication
private _allUsedMedication = _unit getVariable [QGVAR(allUsedMedication), []];
{
   _unit setVariable [_x select 0, nil];
} forEach _allUsedMedication;
_unit setVariable [QGVAR(allUsedMedication), [], true];

private _logs = _unit getVariable [QGVAR(allLogs), []];
{
    _unit setVariable [_x, nil];
} forEach _logs;
_unit setVariable [QGVAR(allLogs), [], true];

// items
[{
    _this call FUNC(itemCheck);
}, [_unit], 0.5, 0.1] call CBA_fnc_waitAndExecute;
