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

_target setVariable [QEGVAR(medical,pain), 0, true];
_target setVariable [QEGVAR(medical,bloodVolume), DEFAULT_BLOOD_VOLUME, true];

// tourniquets
_target setVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0], true];
_target setVariable [QGVAR(occludedMedications), nil, true];

// wounds and injuries
_target setVariable [QEGVAR(medical,openWounds), [], true];
_target setVariable [QEGVAR(medical,bandagedWounds), [], true];
_target setVariable [QEGVAR(medical,stitchedWounds), [], true];
_target setVariable [QEGVAR(medical_engine,isLimping), false, true];

// vitals
_target setVariable [QEGVAR(medical,heartRate), 80, true];
_target setVariable [QEGVAR(medical,heartRateAdjustments), [], true];
_target setVariable [QEGVAR(medical,bloodPressure), [80, 120], true];
_target setVariable [QEGVAR(medical,peripheralResistance), 100, true];
_target setVariable [QGVAR(peripheralResistanceAdjustments), [], true];

// IVs
_target setVariable [QEGVAR(medical,ivBags), nil, true];

// damage storage
_target setVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0], true];
#ifdef DEBUG_TESTRESULTS
_target setVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0], true];
#endif

// generic medical admin
_target setVariable [QEGVAR(medical,inCardiacArrest), false, true];
_target setVariable ["ACE_isUnconscious", false, true];
_target setVariable [QEGVAR(medical,hasLostBlood), 0, true];
_target setVariable [QEGVAR(medical,isBleeding), false, true];
_target setVariable [QEGVAR(medical,hasPain), false, true];
_target setVariable [QEGVAR(medical,painSuppress), 0, true];
_target setVariable [QGVAR(painSuppressAdjustments), [], true];
_target setVariable [QGVAR(partialHealCounter), 0, true];

// medication
private _allUsedMedication = _target getVariable [QEGVAR(medical,allUsedMedication), []];

{
   _target setVariable [_x select 0, nil];
} forEach _allUsedMedication;

[_target, false] call EFUNC(medical_engine,setLimping);

// Resetting damage
_target setDamage 0;

[QEGVAR(medical,FullHeal), _target] call CBA_fnc_localEvent;

[_target, "activity", ELSTRING(medical,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", ELSTRING(medical,Activity_fullHeal), [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog); // TODO expand message
