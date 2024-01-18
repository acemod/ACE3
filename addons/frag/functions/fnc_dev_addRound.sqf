#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function initialize projectile tracking of a round so that it's path
 * can be drawn in debug mode. It may optionally include hit / explode /
 * deflected event handlers that spawn color coded spheres on each event,
 * green / red / blue, respectively.
 *
 * Arguments:
 * 0: Projectile to be tracked. <OBJECT>
 * 1: Add projectile hit/explode/defelceted event handlers. <BOOL>
 * 2: Is the round fired by a unit on the same side as the player
 *    true results in blue traces, false in red. <BOOL>
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

if (_isSidePlayer) then {
    GVAR(dev_trackLines) set [getObjectID _projectile, [[getposATL _projectile], [0, 0, 1, 1]]];
} else {
    GVAR(dev_trackLines) set [getObjectID _projectile, [[getposATL _projectile], [1, 0, 0, 1]]];
};

// event handler to track round and cleanup when round is "dead"
[
    {
        if (isGamePaused) exitWith {};
        params ["_params", "_handle"];
        _params params ["_projectile"];
        if (!alive _projectile) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
        private _projectileArray = GVAR(dev_trackLines) getOrDefault [getObjectID _projectile, -1];
        if (_projectileArray isEqualType 0) exitWith {};
        (_projectileArray#0) pushBack getPosATL _projectile;
    },
    0,
    [_projectile]
] call CBA_fnc_addPerFrameHandler;

if (!_addProjectileEventHandlers) exitWith {};

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
