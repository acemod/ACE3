#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Draws the current temp marker.  Allows rotation.
 *
 * Arguments:
 * 0: TheMap <Control>
 *
 * Return Value:
 * None
 *
 * Example:
 * [theMapControl] call ace_markers_fnc_mapDrawEH;
 *
 * Public: No
 */

params ["_theMap"];
// TRACE_1("params",_theMap);

//Only show if marker place is open:
if (isNull findDisplay 54) exitWith {};
//Error checking:
if (GVAR(currentMarkerConfigName) == "" || {GVAR(currentMarkerColorConfigName) == ""} || {GVAR(currentMarkerPosition) isEqualTo []}) exitWith {
    ERROR("Bad Data");
};

private _sizeX = 1;
private _sizeY = 1;

private _textureConfig = configFile >> "CfgMarkers" >> GVAR(currentMarkerConfigName);
private _texture = getText (_textureConfig >> "icon");
private _markerSize = getNumber (_textureConfig >> "size");
private _markerShadow = getNumber (_textureConfig >> "shadow");
private _colorConfig = (configFile >> "CfgMarkerColors" >> GVAR(currentMarkerColorConfigName));
private _drawColor = getArray (_colorConfig >> "color");

//Convert possible code into numbers
{
    if (_x isEqualType "") then {
        _drawColor set [_forEachIndex, call compile _x];
    };
} forEach _drawColor;

_drawColor set [3, (_drawColor select 3) * 0.875]; //Arma adds a slight transparency

_theMap drawIcon [
    _texture,
    _drawColor,
    GVAR(currentMarkerPosition),
    _sizeX * _markerSize,
    _sizeY * _markerSize,
    GVAR(currentMarkerAngle),
    "",
    _markerShadow
];
