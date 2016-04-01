/*
 * Author: esteldunedain
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

#include "script_component.hpp"

private ["_dir", "_params", "_control", "_button", "_screenPos", "_shiftKey", "_ctrlKey", "_handled", "_pos"];

_control   = _this select 0;
_dir       = _this select 1;
_handled   = false;

_handled = true;
// If drawing, change line color


//@todo AGM bug:
// ACE_Map_drawColors is never defined

/* if (count GVAR(drawing_tempLineMarker) > 0) then {
ACE_Map_drawColor = if (_dir > 0) then {ACE_Map_drawColor + 1} else {ACE_Map_drawColor - 1};
if (ACE_Map_drawColor >= count ACE_Map_drawColors) then {
    ACE_Map_drawColor = ACE_Map_drawColor - count ACE_Map_drawColors;
};
if (ACE_Map_drawColor < 0) then {
    ACE_Map_drawColor = ACE_Map_drawColor + count ACE_Map_drawColors;
};
GVAR(drawing_tempLineMarker) set [3, ACE_Map_drawColor];
GVAR(drawing_tempLineMarker) call ACE_Map_fnc_updateLineMarker;

_handled = true;
}; */
_handled
