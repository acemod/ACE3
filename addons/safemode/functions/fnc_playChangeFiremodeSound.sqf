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
#include "script_component.hpp"

private ["_sound", "_position"];

params ["_unit", "_weapon"];

_sound = getArray (configFile >> "CfgWeapons" >> _weapon >> "changeFiremodeSound");

if (count _sound == 0) exitWith {
    playSound "ACE_Sound_Click";
};

// add file extension
if ({(toLower (_sound select 0) find _x == (count toArray (_sound select 0) - count toArray _x) - 1)} count [".wav", ".ogg", ".wss"] == 0) then {
    _sound set [0, (_sound select 0) + ".wss"];
};

_position = _unit modelToWorldVisual (_unit selectionPosition "RightHand");
_position set [2, (_position select 2) + ((getPosASLW _unit select 2) - (getPosATL _unit select 2) max 0)];

_sound params ["_filename", ["_volume", 1], ["_soundPitch", 1], ["_distance", 0]];
playSound3D [_filename, objNull, false, _position, _volume, _soundPitch, _distance];
