#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds an object to have it's course tracked (every frame).
 *
 * Arguments:
 * 0: Object to draw hitbox <OBJECT>
 * 1: Color of trace <STRING>
 * 2: Whether the object is a projectile <BOOL>
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
	"_obj",
	["_color", "blue", ["blue"]],
	["_isProj", false, [false]]
];
TRACE_4("devDraw",_this,_obj,_color,_isProj);
/// track round on each frame
// Create entry in position array from hashmap
private _pID = getObjectID _obj;
if (GVAR(fadeRounds)) then
{
    private _colorArray = switch (toLower _color) do {
        case "purple": {[0.8, 0, 0.8, __FADE_INIT]};
        case "blue":   {[0, 0, 0.8, __FADE_INIT]};
        case "green":  {[0, 0.8, 0, __FADE_INIT]};
        case "orange": {[0.8, 0.518, 0, __FADE_INIT]};
        case "yellow": {[0.8, 0.8, 0, __FADE_INIT] };
        case "red":    {[0.8, 0, 0, __FADE_INIT]};
        case "black":  {[1, 1, 1, __FADE_INIT]};
        case "white":  {[0, 0, 0, __FADE_INIT]};
        default 			 {[0, 0.8, 0.8, __FADE_INIT]};
    };

    GVAR(dev_trackLines) set [_pID, [__FADE_INIT, [getposATL _obj], _colorArray]];
    // add fading factor
    [LINKFUNC(dev_fadeRound),	__FADE_INTERVAL, [_pID]] call CBA_fnc_addPerFrameHandler;
} else
{
    private _colorArray = switch (toLower _color) do {
        case "purple": {[0.8, 0, 0.8, 1]};
        case "blue":   {[0, 0, 0.8, 1]};
        case "green":  {[0, 0.8, 0, 1]};
        case "orange": {[0.8, 0.518, 0, 1]};
        case "yellow": {[0.8, 0.8, 0, 1] };
        case "red":    {[0.8, 0, 0, 1]};
        case "black":  {[1, 1, 1, 1]};
        case "white":  {[0, 0, 0, 1]};
        default 			 {[0, 0.8, 0.8, 1]};
    };
    GVAR(dev_trackLines) set [_pID, [1, [getposATL _obj], _colorArray]];
};
// eventhandler to track round and cleanup when round is "dead"
[
    {
        if (isGamePaused) exitWith {};
        params ["_par", "_h"];
        _par params ["_obj"];
        if (!alive _obj) exitWith {
            [_h] call CBA_fnc_removePerFrameHandler;
        };
        private _arr = GVAR(dev_trackLines) getOrDefault [(getObjectID _obj), -1];
        
        if (typeName _arr isEqualTo "SCALAR") exitWith {
            [_h] call CBA_fnc_removePerFrameHandler;
        };

        (_arr#1) pushBack getPosATL _obj;
        if (_arr#0 <= 0) exitWith {
            [_h] call CBA_fnc_removePerFrameHandler;
        };
    },
    0,
    [_obj]
] call CBA_fnc_addPerFrameHandler;

if (!_isProj) exitWith {};


// Add hitpart eventHandler 
_obj addEventHandler [
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
_obj addEventHandler [
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