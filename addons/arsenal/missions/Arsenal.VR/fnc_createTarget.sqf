#include "script_component.hpp"
/*
 * Author: commy2
 *
 * Public: No
*/

params ["_type", "_position", ["_group", grpNull], "_varName"];

private _player = player;

if (isNull _group) then {
    _group = createGroup east;
};

private _target = _group createUnit [_type, [10, 10, 0], [], 0, "NONE"];

// _varName is used for respawning unit
if (isNil "_varName") then {
    _varName = _target call BIS_fnc_netId;
};

// Set up AI
_target setPos _position;
_target setDir (_position getDir _player);
_target doWatch position _player;
_target addRating -10e10;
_target setUnitPos "UP";
_target setBehaviour "CARELESS";
_target setCombatMode "BLUE";
_target setSpeedMode "LIMITED";
_target disableAI "TARGET";
_target disableAI "AUTOTARGET";
_target allowFleeing 0;
_target setSpeaker "BASE";

[{
    params ["_target", "_time"];

    if (speaker _target == "BASE") exitWith {time > _time};

    _target setSpeaker "BASE";

    false
}, {}, [_target, time + 1]] call CBA_fnc_waitUntilAndExecute;

_player reveal [_target, 4];

// Copy player's gear onto target
if (vest _player != "") then { _target addVest vest _player; };
if (backpack _player != "") then { _target addBackpack backpack _player; };
if (headgear _player != "") then { _target addHeadgear headgear _player; };
if (goggles _player != "") then { _target addGoggles goggles _player; };
if (primaryWeapon _player != "") then { _target addWeapon primaryWeapon _player; };
if (secondaryWeapon _player != "") then { _target addWeapon secondaryWeapon _player; };
if (handgunWeapon _player != "") then { _target addWeapon handgunWeapon _player; };

// Save AI for respawn
_target setVehicleVarName _varName;
missionNamespace setVariable [_varName, _target];

_target switchMove "amovpercmstpslowwrfldnon";
_target setVariable ["origin", _position];

// When killed, respawn AI
_target addEventHandler ["Killed", {
    params ["_target"];

    // Killed may fire twice, 2nd will be null - https://github.com/acemod/ACE3/pull/7561
    if (isNull _target) exitWith { TRACE_1("Ignoring null death",_target); };

    private _position = _target getVariable ["origin", position _target];
    private _varName = vehicleVarName _target;

    [_target, true] spawn BIS_fnc_VREffectKilled;

    // When unit's corpse is deleted, spawn in new one of same type
    [{isNull (_this select 0)}, {
        (_this select 1) call FUNC(createTarget);
    }, [_target, [typeOf _target, _position, group _target, _varName]]] call CBA_fnc_waitUntilAndExecute;
}];

_target call BIS_fnc_VRHitpart;
_target
