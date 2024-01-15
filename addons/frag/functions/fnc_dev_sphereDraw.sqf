#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add a colored sphere at a specified point
 *
 * Arguments:
 * 0: ASL position to add sphere <ARRAY>
 * 1: Color of sphere <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit0, player] call ace_frag_fnc_dev_switchUnitHandle;
 *
 * Public: No
 */
params [
    ["_posASL", [0, 0, 0], [[]], [2,3]],
    ["_color", "(1,0,0,0.5)", [""]]
];

if (count _posASL < 3) then
{
    _posASL pushBack 0;
    _posASL = ASLtoATL _posASL;
    _posASL set [2, 0];
    _posASL = ATLtoASL _posASL;
};

if (_color select [0,1] != "(") then
{
    switch (toLower _color) do
    {
        case "blue": { _color = "(0,0,0.8,0.5)"; };
        case "black": { _color = "(1,1,1,0.5)"; };
        case "white": { _color = "(0,0,0,0.5)"; };
        case "red": { _color = "(0.8,0,0,0.5)"; };
        case "green": { _color = "(0,0.8,0,0.5)"; };
        case "yellow": { _color = "(0.8,0.8,0,0.5)"; };
        case "orange": { _color = "(0.8,0.518,0,0.5)"; };
        default { _color =  "(0.8,0.8,0,0.5)";};
    };
};
private _clrStr = "#(argb,8,8,3)color" + _color;

private _sphere = "Sign_Sphere25cm_F" createVehicle [1,2,34];
_sphere setObjectTextureGlobal [0, _clrStr];
_sphere setPosASL _posASL;
GVAR(dev_eventSpheres) pushBack _sphere;

_sphere;