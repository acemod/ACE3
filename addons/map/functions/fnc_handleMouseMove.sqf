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
GVAR(mousePosition) = _control ctrlMapScreenToWorld _pos;
GVAR(mousePosition) set [2, 0];  //convert 2d pos to 3d

// If cannot draw then exit
if !(call FUNC(canDraw)) exitWith {
  // If was drawing, cancel
  if (GVAR(drawing)) then {
    call AGM_Map_fnc_cancelDrawing;
  };
  false
};

// Handle drawing
if (GVAR(drawing)) exitWith {
  GVAR(tempLineMarker) set [2, GVAR(mousePosition)];
  GVAR(tempLineMarker) call AGM_Map_fnc_updateLineMarker;
  false
};

// Handle Map tools
if (isNil QGVAR(mapToolFixed)) exitWith {false};

// Translation
if (GVAR(mapToolDragging)) exitWith {
  AGM_Map_pos set [0, (AGM_Map_startPos select 0) + (GVAR(mousePosition) select 0) - (AGM_Map_startDragPos select 0)];
  AGM_Map_pos set [1, (AGM_Map_startPos select 1) + (GVAR(mousePosition) select 1) - (AGM_Map_startDragPos select 1)];

  // Update the size and rotation of the maptool
  [] call AGM_Map_fnc_updateMapToolMarkers;
  true
};

// Rotation
if (GVAR(mapToolRotating)) exitWith {
  // Get new angle
  _angle =  (180 + ((GVAR(mousePosition) select 0) - (AGM_Map_startPos select 0)) atan2 ((GVAR(mousePosition) select 1) - (AGM_Map_startPos select 1)) mod 360);
  AGM_Map_angle = AGM_Map_startAngle + _angle - AGM_Map_startDragAngle;

  // Update the size and rotation of the maptool
  [] call AGM_Map_fnc_updateMapToolMarkers;
  true
};

false
