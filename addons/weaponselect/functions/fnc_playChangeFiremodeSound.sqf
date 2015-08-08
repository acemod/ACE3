/*
 * Author: commy2
 * Play the change firemode sound for specified weapon at units position.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_weaponselect_fnc_playChangeFiremodeSound
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_sound"];

params ["_unit", "_weapon"];

_sound = getArray (configFile >> "CfgWeapons" >> _weapon >> "changeFiremodeSound");

if (count _sound == 0) exitWith {};

// add file extension
if call {
    {
        if (toLower (_sound select 0) find _x == count toArray (_sound select 0) - count toArray _x - 1) exitWith {false};
        true
    } forEach [".wav", ".ogg", ".wss"];
} then {
    _sound set [0, (_sound select 0) + ".wss"];
};

// add default volume, pitch and distance
if (count _sound < 2) then {_sound pushBack 1};
if (count _sound < 3) then {_sound pushBack 1};
if (count _sound < 4) then {_sound pushBack 0};

private "_position";

_position = _unit modelToWorldVisual (_unit selectionPosition "RightHand");
_position set [2, (_position select 2) + ((getPosASLW _unit select 2) - (getPosATL _unit select 2) max 0)];

playSound3D [_sound select 0, objNull, false, _position, _sound select 1, _sound select 2, _sound select 3];
