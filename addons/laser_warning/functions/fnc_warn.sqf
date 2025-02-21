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

systemChat "warn!";

private _heading = (getPosASLVisual _object) getDirVisual (_laserSource);
private _soundState = _object getVariable [QGVAR(state_audio), [false]];

if (_soundState select 0) then {
    _soundState params ["", "_offset", "_onlyCrew", "_soundBank"];
    private _audioSequence = [_heading, getDirVisual _object, AUDIO_SETTING_PURE, _soundBank] call FUNC(constructAudio);
    private _targets = [];
    if (_onlyCrew) then {
        _targets = (crew _object) select { alive _x };
    };
    [_audioSequence, _targets] call FUNC(audio_playSequence);
};
