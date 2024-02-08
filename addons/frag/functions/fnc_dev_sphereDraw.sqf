#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add a colored sphere at a specified point.
 *
 * Arguments:
 * 0: ASL position to add sphere. <ARRAY>
 * 1: Color of sphere. <STRING> (Default: Blue)
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
    "_posASL",
    ["_color", "blue", [""]]
];

if (_color select [0,1] != "(") then {
    _color = switch (toLowerANSI _color) do {
        case "blue": {"(0,0,0.8,0.5)"};
        case "black": {"(1,1,1,0.5)"};
        case "white": {"(0,0,0,0.5)"};
        case "red": {"(0.8,0,0,0.5)"};
        case "green": {"(0,0.8,0,0.5)"};
        case "yellow": {"(0.8,0.8,0,0.5)"};
        case "orange": {"(0.8,0.518,0,0.5)"};
        default {"(0.8,0.8,0,0.5)"};
    };
};
private _colorString = "#(argb,8,8,3)color" + _color;

private _sphere = createVehicle ["Sign_Sphere25cm_F", ASLtoATL _posASL, [], 0, "CAN_COLLIDE"];
_sphere setObjectTextureGlobal [0, _colorString];
GVAR(dev_eventSpheres) pushBack _sphere;