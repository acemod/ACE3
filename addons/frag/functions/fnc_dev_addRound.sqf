#include "..\script_component.hpp"
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
 * [_projectile, false, false] call ace_frag_dev_addRound;
 *
 * Public: No
 */
params [
    "_projectile",
    ["_addProjectileEventHandlers", true, [true]],
    ["_isSidePlayer", true, [true]]
];

// track round on each frame
// Create entry in position array from hashmap
if (_isSidePlayer) then {
    GVAR(dev_trackLines) set [getObjectID _projectile, [[getposATL _projectile], [0, 0, 1, 1]]];
} else {
    GVAR(dev_trackLines) set [getObjectID _projectile, [[getposATL _projectile], [1, 0, 0, 1]]];
};
// eventhandler to track round and cleanup when round is "dead"
[
    {
        if (isGamePaused) exitWith {};
        params ["_par", "_handle"];
        _par params ["_projectile"];
        if (!alive _projectile) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
        private _projectileArray = GVAR(dev_trackLines) getOrDefault [(getObjectID _projectile), -1];
        if (typeName _projectileArray == "SCALAR") exitWith {};
        (_projectileArray#0) pushBack getPosATL _projectile;
    },
    0,
    [_projectile]
] call CBA_fnc_addPerFrameHandler;

if (!_addProjectileEventHandlers) exitWith {};

// Add hitpart eventHandler
_projectile addEventHandler [
    "HitPart",
    {
        params ["_projectile", "", "", "_posASL"];
        private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
        _posArr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then {
            [_posASL, "green"] call FUNC(dev_sphereDraw);
        };
    }
];

// Add explode eventHandler
_projectile addEventHandler [
    "Explode",
    {
        params ["_projectile", "_posASL"];
        private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
        _posArr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then {
            [_posASL, "red"] call FUNC(dev_sphereDraw);
        };
    }
];

// Add deflected eventHandler
_projectile addEventHandler [
    "Deflected",
    {
        params ["_projectile", "_posASL"];
        private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
        _posArr pushBack ASLtoATL _posASL;
        if (GVAR(dbgSphere)) then {
            [_posASL, "blue"] call FUNC(dev_sphereDraw);
        };
    }
];
