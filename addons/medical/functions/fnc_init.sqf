/*
 * Author: KoffeinFlummi
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

private ["_unit", "_allUsedMedication", "_logs"];

_unit = _this select 0;

_unit setVariable [QGVAR(pain), 0, true];
_unit setVariable [QGVAR(morphine), 0, true];
_unit setVariable [QGVAR(bloodVolume), 100, true];

// tourniquets
_unit setvariable [QGVAR(tourniquets), [0,0,0,0,0,0], true];

// wounds and injuries
_unit setvariable [QGVAR(openWounds), [], true];
_unit setvariable [QGVAR(bandagedWounds), [], true];
_unit setVariable [QGVAR(internalWounds), [], true];
_unit setvariable [QGVAR(lastUniqueWoundID), 1, true];

// vitals
_unit setVariable [QGVAR(heartRate), 80];
_unit setvariable [QGVAR(heartRateAdjustments), []];
_unit setvariable [QGVAR(bloodPressure), [80, 120]];
_unit setVariable [QGVAR(peripheralResistance), 100];

// fractures
_unit setVariable [QGVAR(fractures), [], true];

// triage card and logs
_unit setvariable [QGVAR(triageLevel), 0, true];
_unit setvariable [QGVAR(triageCard), [], true];

// IVs
_unit setVariable [QGVAR(salineIVVolume), 0, true];
_unit setVariable [QGVAR(plasmaIVVolume), 0, true];
_unit setVariable [QGVAR(bloodIVVolume), 0, true];

// damage storage
_unit setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

// airway
_unit setvariable [QGVAR(airwayStatus), 100];
_unit setVariable [QGVAR(airwayOccluded), false];
_unit setvariable [QGVAR(airwayCollapsed), false];

// generic medical admin
_unit setvariable [QGVAR(addedToUnitLoop), false, true];
_unit setvariable [QGVAR(inCardiacArrest), false, true];
_unit setVariable ["ACE_isUnconscious", false, true];
_unit setvariable [QGVAR(hasLostBlood), 0, true];
_unit setvariable [QGVAR(isBleeding), false, true];
_unit setvariable [QGVAR(hasPain), false, true];
_unit setvariable [QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives), true];
_unit setvariable [QGVAR(painSuppress), 0, true];

// medication
_allUsedMedication = _unit getVariable [QGVAR(allUsedMedication), []];
{
   _unit setvariable [_x select 0, nil];
} foreach _allUsedMedication;
_unit setVariable [QGVAR(allUsedMedication), [], true];

_logs = _unit getvariable [QGVAR(allLogs), []];
{
    _unit setvariable [_x, nil];
} foreach _logs;
_unit setvariable [QGVAR(allLogs), [], true];

// items
[{
    _this call FUNC(itemCheck);
}, [_unit], 0.5, 0.1] call EFUNC(common,waitAndExecute);
