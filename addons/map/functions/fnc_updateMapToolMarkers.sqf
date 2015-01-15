/*
 * Author: CAA-Picard
 *
 * Update the map tool markers, position, size, rotation and visibility.
 *
 * Argument:
 * None
 *
 * Return value:
 * Nothing
 */

#include "script_component.hpp"

#define TEXTURE_WIDTH_IN_M    6205
#define CENTER_OFFSET_Y_PERC  0.1606
#define CONSTANT_SCALE        0.2

// If markers exist and they should'nt, delete them
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) == 0}) then {
  // If markers exist, delete them
  if (!isNil QGVAR(mapTool_markerRotatingFixed)) then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_FIXED;
    GVAR(mapTool_markerRotatingFixed) = nil;
  };
};
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) != 1}) then {
  if (!isNil "GVAR(mapTool_markerRotatingNormal)") then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGNORMAL;
    GVAR(mapTool_markerRotatingNormal) = nil;
  };
};
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) != 2}) then {
  if (!isNil "GVAR(mapTool_markerRotatingSmall)") then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGSMALL;
    GVAR(mapTool_markerRotatingSmall) = nil;
  };
};

if (!("ACE_MapTools" in items player)|| {GVAR(mapToolsShown) == 0}) exitWith {};

// If markers don't exist and should, create them
if (isNil QGVAR(mapTool_markerRotatingFixed)) then {
  GVAR(mapTool_markerRotatingFixed) = createMarkerLocal [MARKERNAME_MAPTOOL_FIXED, GVAR(mapTool_pos)];
  MARKERNAME_MAPTOOL_FIXED setMarkerType MARKERNAME_MAPTOOL_FIXED;
};
if ((isNil "GVAR(mapTool_markerRotatingNormal)") && {GVAR(mapToolsShown) == 1}) then {
  GVAR(mapTool_markerRotatingNormal) = createMarkerLocal [MARKERNAME_MAPTOOL_ROTATINGNORMAL, GVAR(mapTool_pos)];
  MARKERNAME_MAPTOOL_ROTATINGNORMAL setMarkerType MARKERNAME_MAPTOOL_ROTATINGNORMAL;
};
if ((isNil "GVAR(mapTool_markerRotatingSmall)") && {GVAR(mapToolsShown) == 2}) then {
  GVAR(mapTool_markerRotatingSmall) = createMarkerLocal [MARKERNAME_MAPTOOL_ROTATINGSMALL, GVAR(mapTool_pos)];
  MARKERNAME_MAPTOOL_ROTATINGSMALL setMarkerType MARKERNAME_MAPTOOL_ROTATINGSMALL;
};

_rotatingMarker = [MARKERNAME_MAPTOOL_ROTATINGNORMAL, MARKERNAME_MAPTOOL_ROTATINGSMALL] select (GVAR(mapToolsShown) - 1);
_textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (GVAR(mapToolsShown) - 1);

// Update scale of both parts
_scale        = _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));
MARKERNAME_MAPTOOL_FIXED setMarkerSizeLocal [_scale,_scale];
_rotatingMarker setMarkerSizeLocal [_scale,_scale];

// Position of the fixed part
_xPos = GVAR(mapTool_pos) select 0;
_yPos = (GVAR(mapTool_pos) select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;
MARKERNAME_MAPTOOL_FIXED setMarkerPosLocal [_xPos,_yPos];

// Position and rotation of the rotating part
_xPos = (GVAR(mapTool_pos) select 0) + sin(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;
_yPos = (GVAR(mapTool_pos) select 1) + cos(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;
_rotatingMarker setMarkerPosLocal [_xPos,_yPos];
_rotatingMarker setMarkerDirLocal GVAR(mapTool_angle);
