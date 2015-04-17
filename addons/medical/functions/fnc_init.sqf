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

private ["_unit", "_allUsedMedication", "_logs", "_forceNew"];

_unit = _this select 0;
_forceNew = if (count _this > 1) then {_this select 1} else {false};

if (!(isnil {_unit getvariable QGVAR(triageLevel)}) && !_forceNew) exitwith {};

_unit setVariable [QGVAR(pain), 0];
_unit setVariable [QGVAR(morphine), 0];
_unit setVariable [QGVAR(bloodVolume), 100];

// tourniquets
_unit setvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

// wounds and injuries
_unit setvariable [QGVAR(openWounds), []];
_unit setvariable [QGVAR(bandagedWounds), []];
_unit setVariable [QGVAR(internalWounds), []];
_unit setvariable [QGVAR(lastUniqueWoundID), 1];

// vitals
_unit setVariable [QGVAR(heartRate), 80];
_unit setvariable [QGVAR(heartRateAdjustments), []];
_unit setvariable [QGVAR(bloodPressure), [80, 120]];
_unit setVariable [QGVAR(peripheralResistance), 100];

// fractures
_unit setVariable [QGVAR(fractures), []];

// triage card and logs
_unit setvariable [QGVAR(triageLevel), 0];
_unit setvariable [QGVAR(triageCard), []];

// IVs
_unit setVariable [QGVAR(salineIVVolume), 0];
_unit setVariable [QGVAR(plasmaIVVolume), 0];
_unit setVariable [QGVAR(bloodIVVolume), 0];

// damage storage
_unit setvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];

// airway
_unit setvariable [QGVAR(airwayStatus), 100];
_unit setVariable [QGVAR(airwayOccluded), false];
_unit setvariable [QGVAR(airwayCollapsed), false];

// generic medical admin
_unit setvariable [QGVAR(addedToUnitLoop), false];
_unit setvariable [QGVAR(inCardiacArrest), false];
_unit setVariable ["ACE_isUnconscious", false];
_unit setvariable [QGVAR(hasLostBlood), false];
_unit setvariable [QGVAR(isBleeding), false];
_unit setvariable [QGVAR(hasPain), false];
_unit setvariable [QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];

// medication
_allUsedMedication = _unit getVariable [QGVAR(allUsedMedication), []];
{
   _unit setvariable [_x select 0, nil];
} foreach _allUsedMedication;
_unit setVariable [QGVAR(allUsedMedication), []];

_logs = _unit getvariable [QGVAR(allLogs), []];
{
    _unit setvariable [_x, nil];
} foreach _logs;
_unit setvariable [QGVAR(allLogs), []];

// items
[{
    _this call FUNC(itemCheck);
}, [_unit], 0.5, 0.1] call EFUNC(common,waitAndExecute);
