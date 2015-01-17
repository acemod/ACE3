/*
 * Author: CAA-Picard
 *
 * Handle key down on map.
 *
 * Argument:
 * 0: Display (display)
 * 1: Key code (number)
 * 2: Shift Key (boolean)
 * 3: Ctrl Key (boolean)
 * 4: Alt Key (boolean)
 *
 * Return value:
 * Boolean, true if event was handled
 */

#include "script_component.hpp"

private ["_dir", "_params", "_control", "_button", "_screenPos", "_shiftKey", "_ctrlKey", "_handled", "_pos"];

_display  = _this select 0;
_code     = _this select 1;
_shiftKey = _this select 2;
_ctrlKey  = _this select 3;
_altKey   = _this select 4;
_handled   = false;

#define DIK_ESCAPE          0x01
#define DIK_DELETE          0xD3

// If pressed Esc while drawing
if (_code == DIK_ESCAPE) exitWith {
  if (GVAR(drawing_isDrawing)) then {
    call FUNC(cancelDrawing);
    _handled = true;
  };
};

if (_code == DIK_DELETE) exitWith {
  if (GVAR(drawing_isDrawing)) then {
    call FUNC(cancelDrawing);
    _handled = true;
  } else {

    // Check if a line marker needs to be deleted
    {
      _relPos = GVAR(mousePosition) vectorDiff (_x select 1);
      _diffVector = (_x select 2) vectorDiff (_x select 1);
      _magDiffVector = vectorMagnitude _diffVector;
      if (_magDiffVector == 0) then {
        _diffVector = [10,0,0];
        _magDiffVector = vectorMagnitude _diffVector;
      };
      _diffVector = _diffVector vectorMultiply (1/_magDiffVector);

      // Projection of the relative position over the longitudinal axis
      _lambdaLong = _diffVector vectorDotProduct _relPos;
      // Projection of the relative position over the trasversal axis
      _lambdaTrasAbs = vectorMagnitude (_relPos vectorDiff (_diffVector vectorMultiply _lambdaLong));
      if (_lambdaLong >= 0 && _lambdaLong <= _magDiffVector && _lambdaTrasAbs <= 5) exitWith {
        // Delete the line marker
        if (GVAR(drawing_syncMarkers)) then {
          ["drawing_removeLineMarker", [_x select 0]] call EFUNC(common,globalEvent);
        } else {
          deleteMarkerLocal (_x select 0);
          GVAR(drawing_lineMarkers) = GVAR(drawing_lineMarkers) - [_x];
        };
        _handled = true;
      };
    } forEach GVAR(drawing_lineMarkers);
  };
};

_handled
