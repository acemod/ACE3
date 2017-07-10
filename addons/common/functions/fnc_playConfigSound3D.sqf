/*
 * Author: esteldunedain
 * Plays a sound defined in CfgSounds using playSound3D, with global effect
 *
 * Arguments:
 * 0: Sound class <STRING>
 * 1: Position ASL <ARRAY>
 * 2: Volume <NUMBER>
 * 3: Distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["sound", [0,0,0], 5, 5] call ace_common_fnc_playConfigSound3D
 *
 * Public: Yes
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_soundClass", "_posASL", "_volume", "_distance"];

private _cfgSound = configFile >> "CfgSounds" >> _soundClass;

if (!isClass _cfgSound) exitWith {
    ERROR_1("CfgSounds class [%1] does not exist", _soundClass);
};

private _args = getArray (_cfgSound >> "sound");
TRACE_1("playConfigSound3D args", _args);
private _pitch = (_args select 2);
// Strip the first \ from the filename
private _fileName = _args select 0;
_fileName = _fileName select [1, count _fileName - 1];
TRACE_1("playConfigSound3D filename", _fileName);

playSound3D [_fileName, objNull, false, _posASL, _volume, _pitch, _distance];
