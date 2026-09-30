#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Constructs an audio sequence that will play a callout which alerts to a laser threat
 *
 * Arguments:
 * 0: Heading to threat <NUMBER>
 * 1: Facing heading <NUMBER>
 *
 * Return Value:
 * Audio Sequence <ARRAY>
 *
 * Example:
 * [245] call ace_laser_warning_fnc_newLaser;
 *
 * Public: No
 */
params ["_headingToThreat", "_facingHeading", "_setting", "_soundBank"];

private _fnc_getSoundFromHash = {
    params ["_clip"];
    GVAR(sound_hash) getOrDefaultCall [
        _clip,
        {
            private _length = getNumber (configFile >> "CfgSounds" >> _clip >> "length");
            [_clip, _length]
        },
        true
    ]
};

private _clipsToPlay = [];

private _laserAudio = _soundBank get "laser";
private _absoluteAudio = _soundBank get "absolute";
private _clockAudio = _soundBank get "clock";
private _headingAudio = _soundBank get "heading";
private _relativeAudio = _soundBank get "relative";

switch (_setting) do {
    case AUDIO_SETTING_TEST: {
        _clipsToPlay pushBack (GVAR(sound_pure) call _fnc_getSoundFromHash);
        _clipsToPlay pushBack (_laserAudio call _fnc_getSoundFromHash);

        {
            _clipsToPlay pushBack (_x call _fnc_getSoundFromHash);
        } forEach _absoluteAudio;
        _clipsToPlay pushBack ((_clockAudio select 0) call _fnc_getSoundFromHash);

        {
            _clipsToPlay pushBack (_x call _fnc_getSoundFromHash);
        } forEach _headingAudio;

        {
            _clipsToPlay pushBack (_x call _fnc_getSoundFromHash);
        } forEach _relativeAudio;
    };
    case AUDIO_SETTING_PURE: {
        private _soundPure = [GVAR(sound_pure)] call _fnc_getSoundFromHash;
        _clipsToPlay = [_soundPure];
    };
    case AUDIO_SETTING_ABSOLUTE: {
        private _directionOnes = floor (_headingToThreat / 1) % 10;
        private _directionTens = floor (_headingToThreat / 10) % 10;
        private _directionHundreds = floor (_headingToThreat / 100) % 10;

        private _clipOnes = _absoluteAudio select _directionOnes;
        private _clipTens = _absoluteAudio select _directionTens;
        private _clipHundreds = _absoluteAudio select _directionHundreds;

        private _soundLaser = [_laserAudio] call _fnc_getSoundFromHash;
        private _soundOnes = [_clipOnes] call _fnc_getSoundFromHash;
        private _soundTens = [_clipTens] call _fnc_getSoundFromHash;
        private _soundHundreds = [_clipHundreds] call _fnc_getSoundFromHash;

        _clipsToPlay = [
            _soundLaser,
            _soundHundreds,
            _soundTens,
            _soundOnes
        ];
    };
    case AUDIO_SETTING_CLOCK: {
        private _relativeHeading = 360 - ((((_facingHeading - _headingToThreat) % 360) + 360) % 360);

        private _soundLaser = [_laserAudio] call _fnc_getSoundFromHash;
        _clipsToPlay = [_soundLaser];
        if (_relativeHeading >= 345 || _relativeHeading < 15) then {
            _clipsToPlay pushBack ([_clockAudio select 12] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 15 && _relativeHeading < 45) then {
            _clipsToPlay pushBack ([_clockAudio select 1] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 45 && _relativeHeading < 75) then {
            _clipsToPlay pushBack ([_clockAudio select 2] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 75 && _relativeHeading < 105) then {
            _clipsToPlay pushBack ([_clockAudio select 3] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 105 && _relativeHeading < 135) then {
            _clipsToPlay pushBack ([_clockAudio select 4] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 135 && _relativeHeading < 165) then {
            _clipsToPlay pushBack ([_clockAudio select 5] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 165 && _relativeHeading < 195) then {
            _clipsToPlay pushBack ([_clockAudio select 6] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 195 && _relativeHeading < 225) then {
            _clipsToPlay pushBack ([_clockAudio select 7] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 225 && _relativeHeading < 255) then {
            _clipsToPlay pushBack ([_clockAudio select 8] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 255 && _relativeHeading < 285) then {
            _clipsToPlay pushBack ([_clockAudio select 9] call _fnc_getSoundFromHash);
        };
        if (_relativeheading >= 285 && _relativeheading < 315) then {
            _clipsToPlay pushBack ([_clockAudio select 10] call _fnc_getSoundFromHash);
        };
        if (_relativeheading >= 315 && _relativeheading < 345) then {
            _clipsToPlay pushBack ([_clockAudio select 11] call _fnc_getSoundFromHash);
        };
        _clipsToPlay pushBack ([_clockAudio select 0] call _fnc_getSoundFromHash);
    };
    case AUDIO_SETTING_RELATIVE: {
        private _relativeHeading = ((((_facingHeading - _headingToThreat) % 360) + 540) % 360) - 180;
        private _laserRight = false;
        if (_relativeHeading < 0) then {
            _laserRight = true;
        };
        _relativeHeading = abs _relativeHeading;

        private _soundLaser = [_laserAudio] call _fnc_getSoundFromHash;
        private _soundFront = [_relativeAudio select 0] call _fnc_getSoundFromHash;
        private _soundBack = [_relativeAudio select 2] call _fnc_getSoundFromHash;
        private _soundRight = [_relativeAudio select 1] call _fnc_getSoundFromHash;
        private _soundLeft = [_relativeAudio select 3] call _fnc_getSoundFromHash;
        /*
            [0, 23) - Front
            [23, 68) - Front-Right
            [68, 112) - Right
            [112, 135) - Back-Right
        */
        _clipsToPlay = [_soundLaser];
        if (_relativeHeading < 68) then {
            _clipsToPlay pushBack _soundFront;
        };
        if (_relativeHeading > 112) then {
            _clipsToPlay pushBack _soundBack;
        };
        if (_relativeHeading > 20 && _relativeHeading <= 160) then {
            if (_laserRight) then {
                _clipsToPlay pushBack _soundRight;
            } else {
                _clipsToPlay pushBack _soundLeft;
            };
        };
    };
    case AUDIO_SETTING_HEADING: {
        private _soundLaser = [_laserAudio] call _fnc_getSoundFromHash;
        _clipsToPlay = [_soundLaser];
        if (_headingToThreat > 300 || _headingToThreat <= 60) then {
            _clipsToPlay pushBack ((_headingAudio select 0) call _fnc_getSoundFromHash);
        };
        if (_headingToThreat > 120 && _headingToThreat <= 240) then {
            _clipsToPlay pushBack ((_headingAudio select 2) call _fnc_getSoundFromHash);
        };
        if (_headingToThreat > 30 && _headingToThreat <= 150) then {
            _clipsToPlay pushBack ((_headingAudio select 1) call _fnc_getSoundFromHash);
        };
        if (_headingToThreat > 210 && _headingToThreat <= 330) then {
            _clipsToPlay pushBack ((_headingAudio select 3) call _fnc_getSoundFromHash);
        };
    };
};

_clipsToPlay