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
  if (AGM_Map_drawing) then {
    call AGM_Map_fnc_cancelDrawing;
    _handled = true;
  };
};

if (_code == DIK_DELETE) exitWith {
  if (AGM_Map_drawing) then {
    call AGM_Map_fnc_cancelDrawing;
    _handled = true;
  } else {

    // Check if a line marker needs to be deleted
    {
      _relPos = AGM_Map_mousePos vectorDiff (_x select 1);
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
        if (AGM_Map_syncMarkers) then {
          [[_x select 0], "AGM_Map_fnc_removeLineMarker", 2] call AGM_Core_fnc_execRemoteFnc;
        } else {
          deleteMarkerLocal (_x select 0);
          AGM_Map_lineMarkers = AGM_Map_lineMarkers - [_x];
        };
        _handled = true;

      };
    } forEach AGM_Map_lineMarkers;
  };
};

_handled
