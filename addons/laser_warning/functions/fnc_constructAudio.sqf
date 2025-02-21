#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Constructs an audio sequence code block that, when called, will play a callout which says the laser direction
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
params ["_headingToThreat", "_facingHeading"];

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

switch (GVAR(sound_setting)) do {
    case AUDIO_SETTING_PURE: {
        private _soundPure = [GVAR(sound_pure)] call _fnc_getSoundFromHash;
        _clipsToPlay = [_soundPure];
    };
    case AUDIO_SETTING_ABSOLUTE: {
        private _directionOnes = floor (_headingToThreat / 1) % 10;
        private _directionTens = floor (_headingToThreat / 10) % 10;
        private _directionHundreds = floor (_headingToThreat / 100) % 10;

        private _clipOnes = GVAR(sound_numbers) select _directionOnes;
        private _clipTens = GVAR(sound_numbers) select _directionTens;
        private _clipHundreds = GVAR(sound_numbers) select _directionHundreds;

        private _soundLaser = [GVAR(sound_laser)] call _fnc_getSoundFromHash;
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

        private _soundLaser = [GVAR(sound_laser)] call _fnc_getSoundFromHash;
        private _soundBack = [GVAR(sound_relative) select 2] call _fnc_getSoundFromHash;
        private _soundRight = [GVAR(sound_relative) select 1] call _fnc_getSoundFromHash;
        private _soundLeft = [GVAR(sound_relative) select 3] call _fnc_getSoundFromHash;
        /*
            [0, 23) - Front
            [23, 68) - Front-Right
            [68, 112) - Right
            [112, 135) - Back-Right
        */
        _clipsToPlay = [_soundLaser];
        if (_relativeHeading >= 345 || _relativeHeading < 15) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 12] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 15 && _relativeHeading < 45) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 1] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 45 && _relativeHeading < 75) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 2] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 75 && _relativeHeading < 105) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 3] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 105 && _relativeHeading < 135) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 4] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 135 && _relativeHeading < 165) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 5] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 165 && _relativeHeading < 195) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 6] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 195 && _relativeHeading < 225) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 7] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 225 && _relativeHeading < 255) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 8] call _fnc_getSoundFromHash);
        };
        if (_relativeHeading >= 255 && _relativeHeading < 285) then {
            _clipsToPlay pushBack ([GVAR(sound_oclock) select 9] call _fnc_getSoundFromHash);
        };
        if (_relativeheading >= 285 && _relativeheading < 315) then {
            _clipsToPlay pushback ([GVAR(sound_oclock) select 10] call _fnc_getSoundFromHash);
        };
        if (_relativeheading >= 315 && _relativeheading < 345) then {
            _clipsToPlay pushback ([GVAR(sound_oclock) select 11] call _fnc_getSoundFromHash);
        };
        _clipsToPlay pushBack ([GVAR(sound_oclock) select 0] call _fnc_getSoundFromHash);
    };
    case AUDIO_SETTING_RELATIVE: {
        private _relativeHeading = ((((_facingHeading - _headingToThreat) % 360) + 540) % 360) - 180;
        private _laserRight = false;
        if (_relativeHeading < 0) then {
            _laserRight = true;
        };
        _relativeHeading = abs _relativeHeading;

        private _soundLaser = [GVAR(sound_laser)] call _fnc_getSoundFromHash;
        private _soundFront = [GVAR(sound_relative) select 0] call _fnc_getSoundFromHash;
        private _soundBack = [GVAR(sound_relative) select 2] call _fnc_getSoundFromHash;
        private _soundRight = [GVAR(sound_relative) select 1] call _fnc_getSoundFromHash;
        private _soundLeft = [GVAR(sound_relative) select 3] call _fnc_getSoundFromHash;
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
        if (_laserRight) then {
            _clipsToPlay pushBack _soundRight;
        } else {
            _clipsToPlay pushBack _soundLeft;
        };
    };
};

[_clipsToPlay, {
    private _accumulatedLength = 0;
    private _sourceObject = createVehicle ["#particlesource", getPos ACE_PLAYER, [], 0, "NONE"];
    {
        _x params ["_clip", "_length"];
        [{
            params ["_clip", "_source"];
            [[_source], [_clip, 0, 1], nil, true] call CBA_fnc_globalSay3D;
        }, [_clip, _sourceObject], _accumulatedLength] call CBA_fnc_waitAndExecute;
        _accumulatedLength = _accumulatedLength  + _length;
    } forEach _this;

    [{
        deleteVehicle _this;
    }, _sourceObject, _accumulatedLength + 0.5] call CBA_fnc_waitAndExecute;
    [CBA_missionTime, _accumulatedLength]
}]