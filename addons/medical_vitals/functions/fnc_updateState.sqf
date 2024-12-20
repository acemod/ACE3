#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Update unit state and status variables
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_medical_vitals_fnc_updateState
 *
 * Public: No
 */

params ["_unit", "_syncValues"];

private _bloodVolume = GET_BLOOD_VOLUME(_unit);
// Set variables for synchronizing information across the net

private _hemorrhage = switch (true) do {
    case (_bloodVolume < BLOOD_VOLUME_CLASS_4_HEMORRHAGE): { 4 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_3_HEMORRHAGE): { 3 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE): { 2 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_1_HEMORRHAGE): { 1 };
    default {0};
};

if (_hemorrhage != GET_HEMORRHAGE(_unit)) then {
    _unit setVariable [VAR_HEMORRHAGE, _hemorrhage, true];
};

private _inPain = GET_PAIN_PERCEIVED(_unit) > 0;
if (_inPain isNotEqualTo IS_IN_PAIN(_unit)) then {
    _unit setVariable [VAR_IN_PAIN, _inPain, true];
};

private _heartRate = GET_HEART_RATE(_unit);
private _woundBloodLoss = GET_WOUND_BLEEDING(_unit);
private _bloodPressure = _unit getVariable [VAR_BLOOD_PRESS, [80, 120]];

_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];

// Statements are ordered by most lethal first.
switch (true) do {
    case (_bloodVolume < BLOOD_VOLUME_FATAL): {
        TRACE_3("BloodVolume Fatal",_unit,BLOOD_VOLUME_FATAL,_bloodVolume);
        [QEGVAR(medical,Bleedout), _unit] call CBA_fnc_localEvent;
    };
    case (IN_CRDC_ARRST(_unit)): {}; // if in cardiac arrest just break now to avoid throwing unneeded events
    case (_hemorrhage == 4): {
        TRACE_3("Class IV Hemorrhage",_unit,_hemorrhage,_bloodVolume);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_heartRate < 20 || {_heartRate > 220}): {
        TRACE_2("heartRate Fatal",_unit,_heartRate);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodPressureH < 50 && {_bloodPressureL < 40} && {_heartRate < 40}): {
        TRACE_4("bloodPressure (H & L) + heartRate Fatal",_unit,_bloodPressureH,_bloodPressureL,_heartRate);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodPressureL >= 190): {
        TRACE_2("bloodPressure L above limits",_unit,_bloodPressureL);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_heartRate < 30): {  // With a heart rate below 30 but bigger than 20 there is a chance to enter the cardiac arrest state
        private _nextCheck = _unit getVariable [QGVAR(nextCheckCriticalHeartRate), CBA_missionTime];
        private _enterCardiacArrest = false;
        if (CBA_missionTime >= _nextCheck) then {
            _enterCardiacArrest = random 1 < (0.4 + 0.6*(30 - _heartRate)/10);  // Variable chance of getting into cardiac arrest.
            _unit setVariable [QGVAR(nextCheckCriticalHeartRate), CBA_missionTime + 5];
        };
        if (_enterCardiacArrest) then {
            TRACE_2("Heart rate critical. Cardiac arrest",_unit,_heartRate);
            [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
        } else {
            TRACE_2("Heart rate critical. Critical vitals",_unit,_heartRate);
            [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
        };
    };
    case (_woundBloodLoss > BLOOD_LOSS_KNOCK_OUT_THRESHOLD): {
        [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_woundBloodLoss > 0): {
        [QEGVAR(medical,LoweredVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_inPain): {
        [QEGVAR(medical,LoweredVitals), _unit] call CBA_fnc_localEvent;
    };
};
