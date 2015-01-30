/*
 * Author: CAA-Picard
 *
 * Copy recieved markers to map
 *
 * Argument:
 * 0: Array of markers to copy (Array)
 *
 * Return value:
 * Return
 */

#include "script_component.hpp"

PARAMS_1(_lineMarkers);

{
  _marker = _x;
  //Add marker if we don't already have it
  if (({(_x select 0) == (_marker select 0)} count GVAR(drawing_lineMarkers)) == 0) then {
    _marker call FUNC(addLineMarker);
  };
} forEach _lineMarkers;
