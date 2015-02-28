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
_unit setVariable [QGVAR(internalWounds), [], true];

// vitals
_unit setVariable [QGVAR(heartRate), 80];
_unit setvariable [QGVAR(heartRateAdjustments), []];
_unit setvariable [QGVAR(bloodPressure), _bloodPressure];
_unit setVariable [QGVAR(peripheralResistance), 100];

// fractures
_unit setVariable [QGVAR(fractures), []];

// triage card and logs
_unit setvariable [QGVAR(triageLevel), 0, true];
_unit setvariable [QGVAR(triageCard), [], true];

// IVs
_unit setVariable [QGVAR(salineIVVolume), 0];
_unit setVariable [QGVAR(plasmaIVVolume), 0];
_unit setVariable [QGVAR(bloodIVVolume), 0];

// damage storage
_unit setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0], true];

// airway
_unit setvariable [QGVAR(airwayStatus), 0, true];
_unit setVariable [QGVAR(airwayOccluded), false, true];
_unit setvariable [QGVAR(airwayCollapsed), true, true];

// generic medical admin
_unit setvariable [QGVAR(addedToUnitLoop), false, true];
_unit setvariable [QGVAR(inCardiacArrest), true,true];
_unit setVariable [QGVAR(isUnconscious), false, true]
_unit setvariable [QGVAR(hasLostBlood), true, true];
_unit setvariable [QGVAR(isBleeding), false, true];
_unit setvariable [QGVAR(hasPain), false, true];

// medication
_allUsedMedication = _target getVariable [QGVAR(allUsedMedication), []];
{
   _unit setvariable [_x select 0, nil];
}foreach _allUsedMedication;

_logs = _unit getvariable [QGVAR(allLogs), []];
{
	_unit setvariable [_x, nil, true];
}foreach _logs;
_unit setvariable [QGVAR(allLogs), [], true];
