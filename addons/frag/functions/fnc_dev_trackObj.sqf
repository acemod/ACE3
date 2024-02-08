#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds an object to have it's course tracked (every frame).
 *
 * Arguments:
 * 0: Object to draw track OBJECT>
 * 1: Color of trace <STRING>
 * 2: Whether the object is a projectile or whether to add projectile EHs <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_frag_fnc_dev_trackObj;
 *
 * Public: No
 */

params [
    "_object",
    ["_color", "blue", ["blue"]],
    ["_isProj", false, [false]]
];
TRACE_3("devDraw",_object,_color,_isProj);

// pick color and add it to the array
private _colorArray = switch (toLowerANSI _color) do {
    case "purple": {[0.8, 0, 0.8, 1]};
    case "blue": {[0, 0, 0.8, 1]};
    case "green": {[0, 0.8, 0, 1]};
    case "orange": {[0.8, 0.518, 0, 1]};
    case "yellow": {[0.8, 0.8, 0, 1]};
    case "red": {[0.8, 0, 0, 1]};
    case "black": {[1, 1, 1, 1]};
    case "white": {[0, 0, 0, 1]};
    default {[0, 0.8, 0.8, 1]};
};
GVAR(dev_trackLines) set [getObjectID _object, [[getPosATL _object], _colorArray]];

// event handler to track round and cleanup when round is "dead"
[
    {
        if (isGamePaused) exitWith {};
        params ["_params", "_handle"];
        _params params ["_object"];
        if (!alive _object) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };
        private _arr = GVAR(dev_trackLines) getOrDefault [(getObjectID _object), -1];

        if (_arr isEqualType 0) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        (_arr#0) pushBack getPosATL _object;
    },
    0,
    [_object]
] call CBA_fnc_addPerFrameHandler;

// Projectile event handlers that add spheres and points for more accurate round tracking
if (!_isProj) exitWith {};

_object addEventHandler [
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

_object addEventHandler [
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

_object addEventHandler [
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