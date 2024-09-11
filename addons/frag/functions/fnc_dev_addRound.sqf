#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function initialize projectile tracking of a round so that its path
 * can be drawn in debug mode. It may optionally include hit / explode /
 * deflected event handlers that spawn color coded spheres on each event,
 * green / red / blue, respectively.
 *
 * Arguments:
 * 0: Projectile to be tracked <OBJECT>
 * 1: Add projectile hit/explode/deflected event handlers <BOOL> (default: true)
 * 2: Should the round track be blue. True results in blue traces, false in red <BOOL> (default: true)
 *
 * Return Value:
 * Nothing Useful
 *
 * Example:
 * [_projectile, false, false] call ace_frag_dev_addRound
 *
 * Public: No
 */

params [
    "_projectile",
    ["_addProjectileEventHandlers", true],
    ["_isTraceBlue", true]
];

private _traceColor = [[1, 0, 0, 1], [0, 0, 1, 1]] select _isTraceBlue;
GVAR(dev_trackLines) set [getObjectID _projectile, [[getPosATL _projectile], _traceColor]];


// PFH to track round and cleanup when round is "dead"
[{
    if (isGamePaused || accTime == 0) exitWith {};
    params ["_projectile", "_handle"];

    if (!alive _projectile) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _projectileArray = GVAR(dev_trackLines) get (getObjectID _projectile);

    if (isNil "_projectileArray") exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    (_projectileArray#0) pushBack getPosATL _projectile;
}, 0, _projectile] call CBA_fnc_addPerFrameHandler;

if (!_addProjectileEventHandlers) exitWith {};

_projectile addEventHandler ["HitPart", {
    params ["_projectile", "", "", "_posASL"];
    private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
    _posArr pushBack ASLToATL _posASL;
    if (GVAR(dbgSphere)) then {
        [_posASL, "green"] call FUNC(dev_sphereDraw);
    };
}];

_projectile addEventHandler ["Explode", {
    params ["_projectile", "_posASL"];
    private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
    _posArr pushBack ASLToATL _posASL;
    if (GVAR(dbgSphere)) then {
        [_posASL, "red"] call FUNC(dev_sphereDraw);
    };
}];

_projectile addEventHandler ["Deflected", {
    params ["_projectile", "_posASL"];
    private _posArr = (GVAR(dev_trackLines) get (getObjectID _projectile))#0;
    _posArr pushBack ASLToATL _posASL;
    if (GVAR(dbgSphere)) then {
        [_posASL, "blue"] call FUNC(dev_sphereDraw);
    };
}];
