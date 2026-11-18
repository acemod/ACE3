#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Warn a LWS object that a laser has hit it
 *
 * Arguments:
 * 0: Object with LWS attached <OBJECT>
 * 1: Position laser came from
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyCar, getPosASL player] call ace_laser_warning_fnc_warn;
 *
 * Public: No
 */
params ["_object", "_laserSource"];

private _heading = (getPosASLVisual _object) getDirVisual (_laserSource);
TRACE_3("laser hit; warn",_object,_laserSource,_heading);

if !([_object] call FUNC(isLwsPowered)) exitWith { /* not powered */ };
private _boxState = _object getVariable [QGVAR(state_box), [POWER_STATE_OFF]];
_boxState params ["", "_log"];
if (0 < count _log) then {
    private _lastLog = _log select -1;
    if (CBA_missionTime - (_lastLog select 0) >= LOG_MINIMUM_TIME_DELTA) then {
        _log pushBack [CBA_missionTime, date, _heading];
        _boxState set [1, _log];
        _object setVariable [QGVAR(state_box), _boxState, true];
    };
} else {
    _log pushBack [CBA_missionTime, date, _heading];
    _boxState set [1, _log];
    _object setVariable [QGVAR(state_box), _boxState, true];
};

private _soundState = _object getVariable [QGVAR(state_audio), [false]];
if (_soundState select 0) then {
    _soundState params ["", "", "", "_soundBank", "_pfhId", "", "_audioQueue"];
    private _audioSequence = [_heading, getDirVisual _object, AUDIO_SETTING_ABSOLUTE, _soundBank] call FUNC(constructAudio);

    _audioQueue params ["_queue", "_popIdx", "_pushIdx"];
    _queue set [_pushIdx, _audioSequence];
    _audioQueue set [2, (_pushIdx + 1) % AUDIO_MAX_QUEUE_LENGTH];
    if (_popIdx == _pushIdx + 1) then {
        _audioQueue set [1, (_popIdx + 1) % AUDIO_MAX_QUEUE_LENGTH];
    };
    _soundState set [6, _audioQueue];
    _object setVariable [QGVAR(state_audio), _soundState, true];

    if (_pfhId < 0) then {
        _soundState set [4, [FUNC(audio_loop), 0, [_object]] call CBA_fnc_addPerFrameHandler];
        _object setVariable [QGVAR(state_audio), _soundState];
    };
};
