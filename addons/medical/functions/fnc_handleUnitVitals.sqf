/*
 * Author: Glowbal
 * Updates the vitals. Is expected to be called every second.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _lastTimeUpdated = _unit getVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
private _deltaT = CBA_missionTime - _lastTimeUpdated;
_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];

TRACE_2("ACE_DEBUG",_unit,_deltaT);

if (_deltaT == 0) exitWith {};

private _lastTimeValuesSynced = _unit getVariable [QGVAR(lastMomentValuesSynced), 0];
private _syncValues = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random(10)));

if (_syncValues) then {
    _unit setVariable [QGVAR(lastMomentValuesSynced), CBA_missionTime];
};

private _bloodVolume = (_unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME]) + ([_unit, _deltaT, _syncValues] call FUNC(getBloodVolumeChange));
_bloodVolume = 0 max _bloodVolume min DEFAULT_BLOOD_VOLUME;

// @todo: replace this and the rest of the setVariable with EFUNC(common,setApproximateVariablePublic)
_unit setVariable  [QGVAR(bloodVolume), _bloodVolume, _syncValues];

TRACE_3("ACE_DEBUG",_bloodVolume,_syncValues,_unit);
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

private _bloodLoss = _unit call FUNC(getBloodLoss);
TRACE_3("ACE_DEBUG",_bloodLoss,_unit getVariable QGVAR(isBleeding),_unit);
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

private _painStatus = _unit getVariable [QGVAR(pain), 0];
TRACE_4("ACE_DEBUG",_painStatus,_unit getVariable QGVAR(hasPain),_unit getVariable QGVAR(painSuppress),_unit);
if (_painStatus > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    if !(_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), true, true];
    };
} else {
    if (_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), false, true];
    };
};

TRACE_6("ACE_DEBUG_ADVANCED_VITALS",_painStatus,_bloodVolume,_unit getVariable QGVAR(hasPain),_unit getVariable QGVAR(morphine),_syncValues,_unit);

// Handle pain due tourniquets, that have been applied more than 120 s ago
private _oldTourniquets = (_unit getVariable [QGVAR(tourniquets), []]) select {_x > 0 && {CBA_missionTime - _x > 120}};
// Increase pain at a rate of 0.001 units/s per old tourniquet
_painStatus = _painStatus + (count _oldTourniquets) * 0.001 * _deltaT;

private _heartRate = (_unit getVariable [QGVAR(heartRate), 80]) + ([_unit, _deltaT] call FUNC(getHeartRateChange));
_unit setVariable  [QGVAR(heartRate), 0 max _heartRate, _syncValues];

private _bloodPressure = [_unit] call FUNC(getBloodPressure);
_unit setVariable  [QGVAR(bloodPressure), _bloodPressure, _syncValues];

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
if (_bloodLoss > BLOOD_LOSS_KNOCK_OUT_THRESHOLD * _cardiacOutput) then {
    [QGVAR(CriticalVitals), _unit] call CBA_fnc_localEvent;
};

#ifdef DEBUG_MODE_FULL
if (!isPlayer _unit) then {
    private _cardiacArrest = _unit getVariable [QGVAR(inCardiacArrest), false];
    hintSilent format["blood volume: %1, blood loss: [%2, %3]\nhr: %4, bp: %5, pain: %6", round(_bloodVolume * 100) / 100, round(_bloodLoss * 1000) / 1000, round((_bloodLoss / _cardiacOutput) * 100) / 100, round(_heartRate), _bloodPressure, round(_painStatus * 100) / 100];
};
#endif

_unit setVariable [QGVAR(pain), 0 max (_painStatus - _deltaT * PAIN_REDUCTION_SPEED), _syncValues];

TRACE_8("ACE_DEBUG_ADVANCED_VITALS",_painStatus,PAIN_REDUCTION_SPEED,_heartRate,_bloodVolume,_bloodPressure,_deltaT,_syncValues,_unit);

_bloodPressure params ["_bloodPressureL", "_bloodPressureH"];
if (_bloodPressureL < 40) then {
    [QGVAR(CriticalVitals), _unit] call CBA_fnc_localEvent;
};
if ((_heartRate < 20) || {_heartRate > 220} || {_bloodPressureH < 50}) then {
    [QGVAR(FatalVitals), _unit] call CBA_fnc_localEvent;
};

// Handle spontaneous wakeup from unconsciousness
if (_unit getVariable [QGVAR(isUnconscious), false]) then {
    if (_unit call FUNC(hasStableVitals)) then {
        private _lastWakeUpCheck = _unit getVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
        if (CBA_missionTime - _lastWakeUpCheck > SPONTANEOUS_WAKE_UP_INTERVAL) then {
            _unit setVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
            if ((random 1) < SPONTANEOUS_WAKE_UP_CHANCE) then {
                [QGVAR(WakeUp), _unit] call CBA_fnc_localEvent;
            };
        };
    } else {
        // Unstable vitals, procrastinate the next wakeup check
        _unit setVariable [QGVAR(lastWakeUpCheck), CBA_missionTime];
    };
};
