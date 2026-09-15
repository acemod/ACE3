#include "..\script_component.hpp"
/*
 * Author: commy2
 * Plays weapon firemode change sound.
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
    playSoundUI ["ACE_Sound_Click"];
};

_sound params [["_filename", ""], ["_volume", 1], ["_soundPitch", 1], ["_distance", 0]];

if (_filename == "") exitWith {
    playSoundUI ["ACE_Sound_Click"];
};

// Add file extension .wss as default
if !(toLowerANSI (_filename select [count _filename - 4]) in [".wav", ".ogg", ".wss"]) then {
    _filename = format ["%1.wss", _filename];
};

// Get position where to play the sound (position of the weapon)
private _position = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");

playSound3D [_filename, objNull, insideBuilding _unit >= 0.5, _position, _volume, _soundPitch, _distance];

nil // return
