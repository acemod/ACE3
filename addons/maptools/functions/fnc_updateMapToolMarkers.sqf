#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Update the map tool markers, position, size, rotation and visibility.
 *
 * Arguments:
 * 0: The Map <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ACE_maptools_fnc_updateMapToolMarkers
 *
 * Public: No
 */

params ["_theMap"];

if ((GVAR(mapTool_Shown) == 0) || {!("ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems)))}) exitWith {};

private _rotatingTexture = "";
private _textureWidth = 0;
if (GVAR(mapTool_Shown) == 1) then {
    _rotatingTexture = QPATHTOF(data\mapToolRotatingNormal.paa);
    _textureWidth = TEXTURE_WIDTH_IN_M;
} else {
    _rotatingTexture = QPATHTOF(data\mapToolRotatingSmall.paa);
    _textureWidth = TEXTURE_WIDTH_IN_M / 2;
};

if (GVAR(freedrawing)) then {[_theMap, _textureWidth] call FUNC(drawLinesOnRoamer);};

// Update scale of both parts
getResolution params ["_resWidth", "_resHeight", "", "", "_aspectRatio"];
private _scaleX = 32 * _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));
private _scaleY = _scaleX * ((_resWidth / _resHeight) / _aspectRatio); //handle bad aspect ratios

// Position of the fixed part
private _xPos = GVAR(mapTool_pos) select 0;
private _yPos = (GVAR(mapTool_pos) select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;

_theMap drawIcon [QPATHTOF(data\mapToolFixed.paa), [1,1,1,1], [_xPos,_yPos], _scaleX, _scaleY, 0, "", 0];

// Position and rotation of the rotating part
_xPos = (GVAR(mapTool_pos) select 0) + sin(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;
_yPos = (GVAR(mapTool_pos) select 1) + cos(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;

_theMap drawIcon [_rotatingTexture, [1,1,1,1], [_xPos,_yPos], _scaleX, _scaleY, GVAR(mapTool_angle), "", 0];
