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
if (!("AGM_MapTools" in items player) || {AGM_Map_mapToolsShown == 0}) then {
  // If markers exist, delete them
  if (!isNil "AGM_Map_mapToolFixed") then {
    deleteMarkerLocal "AGM_MapToolFixed";
    AGM_Map_mapToolFixed = nil;
  };
};
if (!("AGM_MapTools" in items player) || {AGM_Map_mapToolsShown != 1}) then {
  if (!isNil "AGM_Map_mapToolRotatingNormal") then {
    deleteMarkerLocal "AGM_MapToolRotatingNormal";
    AGM_Map_mapToolRotatingNormal = nil;
  };
};
if (!("AGM_MapTools" in items player) || {AGM_Map_mapToolsShown != 2}) then {
  if (!isNil "AGM_Map_mapToolRotatingSmall") then {
    deleteMarkerLocal "AGM_MapToolRotatingSmall";
    AGM_Map_mapToolRotatingSmall = nil;
  };
};

if (!("AGM_MapTools" in items player)|| {AGM_Map_mapToolsShown == 0}) exitWith {};

// If markers don't exist and should, create them
if (isNil "AGM_Map_mapToolFixed") then {
  AGM_Map_mapToolFixed = createMarkerLocal ["AGM_MapToolFixed", AGM_Map_pos];
  "AGM_MapToolFixed" setMarkerType "AGM_MapToolFixed";
};
if ((isNil "AGM_Map_mapToolRotatingNormal") && {AGM_Map_mapToolsShown == 1}) then {
  AGM_Map_mapToolRotatingNormal = createMarkerLocal ["AGM_MapToolRotatingNormal", AGM_Map_pos];
  "AGM_MapToolRotatingNormal" setMarkerType "AGM_MapToolRotatingNormal";
};
if ((isNil "AGM_Map_mapToolRotatingSmall") && {AGM_Map_mapToolsShown == 2}) then {
  AGM_Map_mapToolRotatingSmall = createMarkerLocal ["AGM_MapToolRotatingSmall", AGM_Map_pos];
  "AGM_MapToolRotatingSmall" setMarkerType "AGM_MapToolRotatingSmall";
};

_rotatingMarker = ["AGM_MapToolRotatingNormal", "AGM_MapToolRotatingSmall"] select (AGM_Map_mapToolsShown - 1);
_textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (AGM_Map_mapToolsShown - 1);

// Update scale of both parts
_scale        = _textureWidth * CONSTANT_SCALE * (call AGM_Map_fnc_calculateMapScale);
"AGM_MapToolFixed" setMarkerSizeLocal [_scale,_scale];
_rotatingMarker setMarkerSizeLocal [_scale,_scale];

// Position of the fixed part
_xPos = AGM_Map_pos select 0;
_yPos = (AGM_Map_pos select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;
"AGM_MapToolFixed" setMarkerPosLocal [_xPos,_yPos];

// Position and rotation of the rotating part
_xPos = (AGM_Map_pos select 0) + sin(AGM_Map_angle) * _textureWidth * CENTER_OFFSET_Y_PERC;
_yPos = (AGM_Map_pos select 1) + cos(AGM_Map_angle) * _textureWidth * CENTER_OFFSET_Y_PERC;
_rotatingMarker setMarkerPosLocal [_xPos,_yPos];
_rotatingMarker setMarkerDirLocal AGM_Map_angle;
