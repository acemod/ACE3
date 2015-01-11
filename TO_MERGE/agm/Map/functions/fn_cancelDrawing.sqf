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

AGM_Map_drawing = false;
if (count AGM_Map_tempLineMarker > 0) then {
  deleteMarkerLocal (AGM_Map_tempLineMarker select 0);
};
AGM_Map_tempLineMarker = [];
