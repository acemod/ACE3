#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Plays the audio loop for the LWS
 *
 * Arguments:
 * 0: Passed Arguments <ARRAY>
 * 1: PFH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_laser_warning_fnc_audio_loop] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */
params ["_args", "_pfhId"];
_args params ["_object"];

private _soundState = _object getVariable [QGVAR(state_audio), [false]];
if (_soundState select 0) then {
    _soundState params ["", "_offset", "_onlyCrew", "_soundBank", "_pfhId", "_currentlyPlaying", "_audioQueue"];
    _audioQueue params ["_queue", "_popIdx", "_pushIdx"];

    _currentlyPlaying params ["_startTime", "_length"];
    if (CBA_missionTime - _startTime >= _length + 0.5) then {
        if (_popIdx == _pushIdx) exitWith {
            _soundState set [4, -1];
            _object setVariable [QGVAR(state_audio), _soundState];
            [_pfhId] call CBA_fnc_removePerFrameHandler;
        };

        private _toPlay = _queue select _popIdx;
        private _targets = [];
        if (_onlyCrew) then {
            _targets = (crew _object) select { alive _x };
        };
        ([_toPlay, _targets] call FUNC(audio_playSequence)) params ["_startTime", "_length", "_audioSource"];
        _audioSource attachTo [_object, _offset];

        _currentlyPlaying = [_startTime, _length];
        _soundState set [5, _currentlyPlaying];

        _popIdx = (_popIdx + 1) % AUDIO_MAX_QUEUE_LENGTH ;
        _audioQueue set [1, _popIdx];
        _soundState set [6, _audioQueue];

        _object setVariable [QGVAR(state_audio), _soundState, true];
    };
} else {
    _soundState set [4, -1];
    _object setVariable [QGVAR(state_audio), _soundState];
    [_pfhId] call CBA_fnc_removePerFrameHandler;
};