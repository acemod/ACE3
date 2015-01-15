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

#include "script_component.hpp"

_lineMarkers = _this;

{
  _marker = _x;

  if (({(_x select 0) == (_marker select 0)} count GVAR(drawing_lineMarkers)) == 0) then {
    _marker call FUNC(addLineMarker);
  };
} forEach _lineMarkers;
