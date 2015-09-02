/*
 * Author: esteldunedain
 * Update the map tool markers, position, size, rotation and visibility.
 *
 * Arguments:
 * 0: The Map <CONTROL>
 *
 * Return value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

#define TEXTURE_WIDTH_IN_M    6205
#define CENTER_OFFSET_Y_PERC  0.1606
#define CONSTANT_SCALE        0.2

params ["_theMap"];

private ["_rotatingTexture", "_textureWidth", "_scale", "_xPos", "_yPos"];

// Show/Hide draw buttons
if ([] call FUNC(canDraw)) then {
    { ((findDisplay 12) displayCtrl _x) ctrlShow true; } forEach GVAR(drawing_controls);
} else {
    { ((findDisplay 12) displayCtrl _x) ctrlShow false; } forEach GVAR(drawing_controls);
    if (GVAR(drawing_isDrawing)) then {
        call FUNC(cancelDrawing);
    };
};

if (!("ACE_MapTools" in items ACE_player)|| {GVAR(mapTool_Shown) == 0}) exitWith {};

_rotatingTexture = "";
_textureWidth = 0;
if (GVAR(mapTool_Shown) == 1) then {
    _rotatingTexture = QUOTE(PATHTOF(data\mapToolRotatingNormal.paa));
    _textureWidth = TEXTURE_WIDTH_IN_M;
} else {
    _rotatingTexture = QUOTE(PATHTOF(data\mapToolRotatingSmall.paa));
    _textureWidth = TEXTURE_WIDTH_IN_M / 2;
};

// Update scale of both parts
_scale = _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));

// Position of the fixed part
_xPos = GVAR(mapTool_pos) select 0;
_yPos = (GVAR(mapTool_pos) select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;

_theMap drawIcon [QUOTE(PATHTOF(data\mapToolFixed.paa)), [1,1,1,1], [_xPos,_yPos], (32 * _scale), (32 * _scale), 0, "", 0];

// Position and rotation of the rotating part
_xPos = (GVAR(mapTool_pos) select 0) + sin(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;
_yPos = (GVAR(mapTool_pos) select 1) + cos(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;

_theMap drawIcon [_rotatingTexture, [1,1,1,1], [_xPos,_yPos], (32 * _scale), (32 * _scale), GVAR(mapTool_angle), "", 0];
