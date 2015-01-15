/*
 * Author: CAA-Picard
 *
 * Cancel the drawing of the current line marker
 *
 * Argument:
 * None
 *
 * Return value:
 * Nothing
 */

GVAR(drawing) = false;
if (count GVAR(tempLineMarker) > 0) then {
  deleteMarkerLocal (GVAR(tempLineMarker) select 0);
};
GVAR(tempLineMarker) = [];
