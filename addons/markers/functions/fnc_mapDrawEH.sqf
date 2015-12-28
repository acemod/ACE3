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
#include "script_component.hpp"

private ["_sizeX", "_sizeY", "_textureConfig", "_texture", "_markerSize", "_markerShadow", "_colorConfig", "_drawColor"];

params ["_theMap"];
// TRACE_1("params",_theMap);

//Only show if marker place is open:
if (isNull (findDisplay 54)) exitWith {};
//Error checking:
if ((GVAR(currentMarkerConfigName) == "") || {GVAR(currentMarkerColorConfigName) == ""} || {GVAR(currentMarkerPosition) isEqualTo []}) exitWith {ERROR("Bad Data");};

_sizeX = 1;
_sizeY = 1;

_textureConfig = configFile >> "CfgMarkers" >> GVAR(currentMarkerConfigName);
_texture = getText (_textureConfig >> "icon");
_markerSize = getNumber (_textureConfig >> "size");
_markerShadow = getNumber (_textureConfig >> "shadow");
_colorConfig = (configFile >> "CfgMarkerColors" >> GVAR(currentMarkerColorConfigName));
_drawColor = getArray (_colorConfig >> "color");

//Convert possible code into numbers
{
    if (_x isEqualType "") then {
        _drawColor set [_forEachIndex, (call compile _x)];
    };
} forEach _drawColor;
_drawColor set [3, ((_drawColor select 3) * 0.875)]; //Arma adds a slight transparency

_theMap drawIcon [_texture, _drawColor, GVAR(currentMarkerPosition), (_sizeX * _markerSize), (_sizeY * _markerSize), GVAR(currentMarkerAngle), "", _markerShadow];
