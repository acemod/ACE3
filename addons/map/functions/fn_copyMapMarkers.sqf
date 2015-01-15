/*
 * Author: CAA-Picard
 *
 * Copy markers to mapd
 *
 * Argument:
 * 0: Array of markers to copy (Array)
 *
 * Return value:
 * Return
 */

_lineMarkers = _this;

{
  _marker = _x;

  if (({(_x select 0) == (_marker select 0)} count AGM_Map_lineMarkers) == 0) then {
    _marker call AGM_Map_fnc_addLineMarker;
  };
} forEach _lineMarkers;
