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

#define TEXTURE_WIDTH_IN_M    6205
#define CENTER_OFFSET_Y_PERC  0.1606
#define CONSTANT_SCALE        0.2

// If markers exist and they should'nt, delete them
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) == 0}) then {
  // If markers exist, delete them
  if (!isNil QGVAR(mapToolFixed)) then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_FIXED;
    GVAR(mapToolFixed) = nil;
  };
};
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) != 1}) then {
  if (!isNil "AGM_Map_mapToolRotatingNormal") then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGNORMAL;
    AGM_Map_mapToolRotatingNormal = nil;
  };
};
if (!("ACE_MapTools" in items player) || {GVAR(mapToolsShown) != 2}) then {
  if (!isNil "AGM_Map_mapToolRotatingSmall") then {
    deleteMarkerLocal MARKERNAME_MAPTOOL_ROTATINGSMALL;
    AGM_Map_mapToolRotatingSmall = nil;
  };
};

if (!("ACE_MapTools" in items player)|| {GVAR(mapToolsShown) == 0}) exitWith {};

// If markers don't exist and should, create them
if (isNil QGVAR(mapToolFixed)) then {
  GVAR(mapToolFixed) = createMarkerLocal [MARKERNAME_MAPTOOL_FIXED, AGM_Map_pos];
  MARKERNAME_MAPTOOL_FIXED setMarkerType MARKERNAME_MAPTOOL_FIXED;
};
if ((isNil "AGM_Map_mapToolRotatingNormal") && {GVAR(mapToolsShown) == 1}) then {
  AGM_Map_mapToolRotatingNormal = createMarkerLocal [MARKERNAME_MAPTOOL_ROTATINGNORMAL, AGM_Map_pos];
  MARKERNAME_MAPTOOL_ROTATINGNORMAL setMarkerType MARKERNAME_MAPTOOL_ROTATINGNORMAL;
};
if ((isNil "AGM_Map_mapToolRotatingSmall") && {GVAR(mapToolsShown) == 2}) then {
  AGM_Map_mapToolRotatingSmall = createMarkerLocal [MARKERNAME_MAPTOOL_ROTATINGSMALL, AGM_Map_pos];
  MARKERNAME_MAPTOOL_ROTATINGSMALL setMarkerType MARKERNAME_MAPTOOL_ROTATINGSMALL;
};

_rotatingMarker = [MARKERNAME_MAPTOOL_ROTATINGNORMAL, MARKERNAME_MAPTOOL_ROTATINGSMALL] select (GVAR(mapToolsShown) - 1);
_textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (GVAR(mapToolsShown) - 1);

// Update scale of both parts
_scale        = _textureWidth * CONSTANT_SCALE * (call AGM_Map_fnc_calculateMapScale);
MARKERNAME_MAPTOOL_FIXED setMarkerSizeLocal [_scale,_scale];
_rotatingMarker setMarkerSizeLocal [_scale,_scale];

// Position of the fixed part
_xPos = AGM_Map_pos select 0;
_yPos = (AGM_Map_pos select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;
MARKERNAME_MAPTOOL_FIXED setMarkerPosLocal [_xPos,_yPos];

// Position and rotation of the rotating part
_xPos = (AGM_Map_pos select 0) + sin(AGM_Map_angle) * _textureWidth * CENTER_OFFSET_Y_PERC;
_yPos = (AGM_Map_pos select 1) + cos(AGM_Map_angle) * _textureWidth * CENTER_OFFSET_Y_PERC;
_rotatingMarker setMarkerPosLocal [_xPos,_yPos];
_rotatingMarker setMarkerDirLocal AGM_Map_angle;
