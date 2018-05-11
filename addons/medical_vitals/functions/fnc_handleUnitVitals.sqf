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
if (_bloodVolume < BLOOD_VOLUME_CLASS_1_HEMORRHAGE) then {
    if (_bloodVolume < BLOOD_VOLUME_CLASS_3_HEMORRHAGE) then {
        if (_unit getVariable [QGVAR(hasLostBlood), 0] != 2) then {
            _unit setVariable [QGVAR(hasLostBlood), 2, true];
        };
    } else {
        if (_unit getVariable [QGVAR(hasLostBlood), 0] != 1) then {
            _unit setVariable [QGVAR(hasLostBlood), 1, true];
        };
    };
} else {
    if (_unit getVariable [QGVAR(hasLostBlood), 0] != 0) then {
        _unit setVariable [QGVAR(hasLostBlood), 0, true];
    };
};

private _bloodLoss = GET_BLOOD_LOSS(_unit);
if (_bloodLoss > 0) then {
    _unit setVariable [QGVAR(bloodloss), _bloodLoss, _syncValues];

    [QGVAR(Injury), _unit] call CBA_fnc_localEvent;

    if !(_unit getVariable [QGVAR(isBleeding), false]) then {
        _unit setVariable [QGVAR(isBleeding), true, true];
    };
} else {
    if (_unit getVariable [QGVAR(isBleeding), false]) then {
        _unit setVariable [QGVAR(isBleeding), false, true];
    };
};

private _painLevel = GET_PAIN_PERCEIVED(_unit);
if (_painLevel > 0) then {
    if !(_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), true, true];
    };
} else {
    if (_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), false, true];
    };
};

// Handle pain due tourniquets, that have been applied more than 120 s ago
private _tourniquetPain = 0;
private _tourniquets = _unit getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
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

private _cardiacOutput = [_unit] call EFUNC(medical_status,getCardiacOutput);
if (_bloodLoss > BLOOD_LOSS_KNOCK_OUT_THRESHOLD * _cardiacOutput) then {
    [QGVAR(CriticalVitals), _unit] call CBA_fnc_localEvent;
};

#ifdef DEBUG_MODE_FULL
if (!isPlayer _unit) then {
    hintSilent format["blood volume: %1, blood loss: [%2, %3]\nhr: %4, bp: %5, pain: %6", round(_bloodVolume * 100) / 100, round(_bloodLoss * 1000) / 1000, round((_bloodLoss / (0.001 max _cardiacOutput)) * 100) / 100, round(_heartRate), _bloodPressure, round(_painLevel * 100) / 100];
};
#endif

_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];
if (_bloodPressureL < 40 || {_heartRate < 30}) then {
    [QGVAR(CriticalVitals), _unit] call CBA_fnc_localEvent;
};
if ((_heartRate < 20) || {_heartRate > 220} || {_bloodPressureH < 50}) then {
    [QGVAR(FatalVitals), _unit] call CBA_fnc_localEvent;
};

END_COUNTER(Vitals);
