/*
 * Author: Glowbal
 * Updates the vitals. Called from the statemachine's onState functions.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_vitals_fnc_handleUnitVitals
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_unit"];

private _lastTimeUpdated = _unit getVariable [QGVAR(lastTimeUpdated), 0];
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith {}; // state machines could be calling this very rapidly depending on number of local units

BEGIN_COUNTER(Vitals);

_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
private _lastTimeValuesSynced = _unit getVariable [QGVAR(lastMomentValuesSynced), 0];
private _syncValues = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random 10));

if (_syncValues) then {
    _unit setVariable [QGVAR(lastMomentValuesSynced), CBA_missionTime];
};

private _bloodVolume = GET_BLOOD_VOLUME(_unit) + ([_unit, _deltaT, _syncValues] call EFUNC(medical_status,getBloodVolumeChange));
_bloodVolume = 0 max _bloodVolume min DEFAULT_BLOOD_VOLUME;

// @todo: replace this and the rest of the setVariable with EFUNC(common,setApproximateVariablePublic)
_unit setVariable [VAR_BLOOD_VOL, _bloodVolume, _syncValues];

// Set variables for synchronizing information across the net
private _hemorrhage = switch (true) do {
    case (_bloodVolume < BLOOD_VOLUME_CLASS_4_HEMORRHAGE): { 3 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_3_HEMORRHAGE): { 2 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE): { 1 };
    case (_bloodVolume < BLOOD_VOLUME_CLASS_1_HEMORRHAGE): { 1 };
    default {0};
};

if (_hemorrhage != GET_HEMORRHAGE(_unit)) then {
    _unit setVariable [VAR_HEMORRHAGE, _hemorrhage, true];
};

private _bloodLoss = GET_BLOOD_LOSS(_unit);
if (_bloodLoss > 0) then {
    _unit setVariable [QGVAR(bloodloss), _bloodLoss, _syncValues];
    if !IS_BLEEDING(_unit) then {
        _unit setVariable [VAR_IS_BLEEDING, true, true];
    };
} else {
    if IS_BLEEDING(_unit) then {
        _unit setVariable [VAR_IS_BLEEDING, false, true];
    };
};

private _inPain = GET_PAIN_PERCEIVED(_unit) > 0;
if !(_inPain isEqualTo IS_IN_PAIN(_unit)) then {
    _unit setVariable [VAR_IN_PAIN, _inPain, true];
};

// Handle pain due tourniquets, that have been applied more than 120 s ago
private _tourniquetPain = 0;
private _tourniquets = _unit getVariable [QEGVAR(medical,tourniquets), [0,0,0,0,0,0]];
{
    if (_x > 0 && {CBA_missionTime - _x > 120}) then {
        _tourniquetPain = _tourniquetPain max (CBA_missionTime - _x - 120) * 0.001;
    };
} forEach _tourniquets;
[_unit, _tourniquetPain] call EFUNC(medical,adjustPainLevel);

private _heartRate = [_unit, _deltaT, _syncValues] call FUNC(updateHeartRate);
[_unit, _deltaT, _syncValues] call FUNC(updatePainSuppress);
[_unit, _deltaT, _syncValues] call FUNC(updatePeripheralResistance);

private _bloodPressure = GET_BLOOD_PRESSURE(_unit);
_unit setVariable [VAR_BLOOD_PRESS, _bloodPressure, _syncValues];

_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];

private _cardiacOutput = [_unit] call EFUNC(medical_status,getCardiacOutput);

switch (true) do {
    case (_bloodVolume < BLOOD_VOLUME_FATAL): {
        TRACE_3("BloodVolume Fatal",_unit,BLOOD_VOLUME_FATAL,_bloodVolume);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_heartRate < 20 || {_heartRate > 220}): {
        TRACE_2("heartRate Fatal",_unit,_heartRate);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodPressureH < 50): {
        TRACE_2("bloodPressureH Fatal",_unit,_bloodPressureH);
        [QEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodPressureL < 40): {
        [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_heartRate < 30): {
        [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodLoss > BLOOD_LOSS_KNOCK_OUT_THRESHOLD * _cardiacOutput): {
        [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
    };
    case (_bloodLoss > 0): {
        [QEGVAR(medical,Injury), _unit] call CBA_fnc_localEvent;
    };
    case (_inPain): {
        [QEGVAR(medical,Injury), _unit] call CBA_fnc_localEvent;
    };
};

#ifdef DEBUG_MODE_FULL
if (!isPlayer _unit) then {
    private _painLevel = _unit getVariable [VAR_PAIN, 0];
    hintSilent format["blood volume: %1, blood loss: [%2, %3]\nhr: %4, bp: %5, pain: %6", round(_bloodVolume * 100) / 100, round(_bloodLoss * 1000) / 1000, round((_bloodLoss / (0.001 max _cardiacOutput)) * 100) / 100, round(_heartRate), _bloodPressure, round(_painLevel * 100) / 100];
};
#endif

END_COUNTER(Vitals);
