/*
 * Author: CAA-Picard
 *
 * Handle mouse wheel.
 *
 * Argument:
 * 0: Control
 * 1: Scroll Amount
 *
 * Return value:
 * Boolean, true if event was handled
 */

private ["_dir", "_params", "_control", "_button", "_screenPos", "_shiftKey", "_ctrlKey", "_handled", "_pos"];

_control   = _this select 0;
_dir       = _this select 1;
diag_log "Scroll";
diag_log _this;
_handled   = false;

// If drawing, change line color
if (count AGM_Map_tempLineMarker > 0) then {
  AGM_Map_drawColor = if (_dir > 0) then {AGM_Map_drawColor + 1} else {AGM_Map_drawColor - 1};
  if (AGM_Map_drawColor >= count AGM_Map_drawColors) then {
    AGM_Map_drawColor = AGM_Map_drawColor - count AGM_Map_drawColors;
  };
  if (AGM_Map_drawColor < 0) then {
    AGM_Map_drawColor = AGM_Map_drawColor + count AGM_Map_drawColors;
  };
  AGM_Map_tempLineMarker set [3, AGM_Map_drawColor];
  AGM_Map_tempLineMarker call AGM_Map_fnc_updateLineMarker;
  
  _handled = true;
};
_handled
