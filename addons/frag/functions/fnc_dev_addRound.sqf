#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds a round to be traced 
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Add projectile event handlers <BOOL>
 * 2: Is the round blue <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_proj, false, false] call ace_frag_dev_addRound;
 *
 * Public: No
 */
params [
    "_proj",
    ["_addEHs", true, [true]],
    ["_sidePlayer", true, [true]]
];

// track round on each frame
// Create entry in position array from hashmap
if (_sidePlayer) then
{
    GVAR(dev_trackLines) set [getObjectID _proj, [1, [getposATL _proj], [0, 0, 1, 1]]];
} else
{
    GVAR(dev_trackLines) set [getObjectID _proj, [1, [getposATL _proj], [1, 0, 0, 1]]];
};
// eventhandler to track round and cleanup when round is "dead"
[
    {
        if (isGamePaused) exitWith {};
        params ["_par", "_h"];
        _par params ["_proj"];
        if (!alive _proj) exitWith
        {
            [_h] call CBA_fnc_removePerFrameHandler;
        };
        private _arr = GVAR(dev_trackLines) getOrDefault [(getObjectID _proj), -1];
        if (typeName _arr == "SCALAR") exitWith {};
        (_arr#1) pushBack getPosATL _proj;
        if (_arr#0 <= 0) exitWith
        {
            [_h] call CBA_fnc_removePerFrameHandler;
        };
    },
    0,
    [_proj]
] call CBA_fnc_addPerFrameHandler;

if (!_addEHs) exitWith {};

// Add hitpart eventHandler 
_proj addEventHandler [
    "HitPart",
    {
        params ["_proj", "", "", "_posASL"];
        private _arr = (GVAR(dev_trackLines) get (getObjectID _proj))#1;
        _arr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then
        {
            [_posASL, "green"] call FUNC(dev_sphereDraw);
        };
    }
];

// Add explode eventHandler
_proj addEventHandler [
    "Explode",
    {
        params ["_proj", "_posASL"];
        private _arr = (GVAR(dev_trackLines) get (getObjectID _proj))#1;
        _arr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then
        {
            [_posASL, "red"] call FUNC(dev_sphereDraw);
        };
    }
];

// Add deflected eventHandler
_proj addEventHandler [
    "Deflected",
    {
        params ["_proj", "_posASL"];
        private _arr = (GVAR(dev_trackLines) get (getObjectID _proj))#1;
        _arr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then
        {
            [_posASL, "blue"] call FUNC(dev_sphereDraw);
        };
    }
];