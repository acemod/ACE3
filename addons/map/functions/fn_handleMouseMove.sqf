/*
 * Author: CAA-Picard
 *
 * Handle mouse movement over the map tool.
 *
 * Argument:
 * 0: Map Control
 * 1: Mouse position on screen coordinates
 *
 * Return value:
 * Boolean, true if event was handled
 */

private ["_control", "_pos"];

_control = _this select 0;
_pos = [_this select 1, _this select 2];
AGM_Map_mousePos = _control ctrlMapScreenToWorld _pos;
AGM_Map_mousePos set [count AGM_Map_mousePos, 0];

// If cannot draw then exit
if !(call AGM_Map_fnc_canDraw) exitWith {
  // If was drawing, cancel
  if (AGM_Map_drawing) then {
    call AGM_Map_fnc_cancelDrawing;
  };
  false
};

// Handle drawing
if (AGM_Map_drawing) exitWith {
  AGM_Map_tempLineMarker set [2, AGM_Map_mousePos];
  AGM_Map_tempLineMarker call AGM_Map_fnc_updateLineMarker;
  false
};

// Handle Map tools
if (isNil "AGM_Map_mapToolFixed") exitWith {false};

// Translation
if (AGM_Map_dragging) exitWith {
  AGM_Map_pos set [0, (AGM_Map_startPos select 0) + (AGM_Map_mousePos select 0) - (AGM_Map_startDragPos select 0)];
  AGM_Map_pos set [1, (AGM_Map_startPos select 1) + (AGM_Map_mousePos select 1) - (AGM_Map_startDragPos select 1)];

  // Update the size and rotation of the maptool
  [] call AGM_Map_fnc_updateMapToolMarkers;
  true
};

// Rotation
if (AGM_Map_rotating) exitWith {
  // Get new angle
  _angle =  (180 + ((AGM_Map_mousePos select 0) - (AGM_Map_startPos select 0)) atan2 ((AGM_Map_mousePos select 1) - (AGM_Map_startPos select 1)) mod 360);
  AGM_Map_angle = AGM_Map_startAngle + _angle - AGM_Map_startDragAngle;

  // Update the size and rotation of the maptool
  [] call AGM_Map_fnc_updateMapToolMarkers;
  true
};

false
