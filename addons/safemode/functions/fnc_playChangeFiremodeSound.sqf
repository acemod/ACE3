#include "script_component.hpp"
/*
 * Author: commy2
 * Play weapon firemode change sound.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player] call ace_safemode_fnc_playChangeFiremodeSound
 *
 * Public: No
 */

params ["_unit", "_weapon"];

private _sound = getArray (configFile >> "CfgWeapons" >> _weapon >> "changeFiremodeSound");

if (_sound isEqualTo []) exitWith {
    playSound "ACE_Sound_Click";
};

// get position where to play the sound (position of the weapon)
private _position = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "RightHand"));

_sound params ["_filename", ["_volume", 1], ["_soundPitch", 1], ["_distance", 0]];

if (_filename == "") exitWith {
    playSound "ACE_Sound_Click";
};

// add file extension .wss as default
if !(toLower (_filename select [count _filename - 4]) in [".wav", ".ogg", ".wss"]) then {
    _filename = format ["%1.wss", _filename];
};

playSound3D [_filename, objNull, false, _position, _volume, _soundPitch, _distance];
