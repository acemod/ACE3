/*
 * Author: esteldunedain
 * Plays a sound defined in CfgSounds using playSound3D, with global effect.
 *
 * Arguments:
 * 0: Sound class <STRING>
 * 1: Position ASL <ARRAY>
 * 2: Volume <NUMBER> (default: from sound config)
 * 3: Distance <NUMBER> (default: from sound config)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["hint", getPosASL player, 5, 5] call ace_common_fnc_playConfigSound3D
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_soundClass", "_posASL", "_volume", "_distance"];

private _sound = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
if (_sound isEqualTo []) exitWith {
    ERROR_1("CfgSounds class [%1] does not exist or contains empty sound array", _soundClass);
};
TRACE_2("sound",_soundClass,_sound);

_sound params ["_fileName", "_cfgVolume", "_pitch", ["_cfgDistance", 0]];

ISNILS(_volume,_cfgVolume);
ISNILS(_distance,_cfgDistance);

// Strip the first \ from the filename
_fileName = _fileName select [1];

// add file extension .wss as default
if !(toLower (_fileName select [count _fileName - 4]) in [".wav", ".ogg", ".wss"]) then {
    ADD(_fileName,".wss");
};
TRACE_5("vars",_fileName,_posASL,_volume,_pitch,_distance);

playSound3D [_fileName, objNull, false, _posASL, _volume, _pitch, _distance];
