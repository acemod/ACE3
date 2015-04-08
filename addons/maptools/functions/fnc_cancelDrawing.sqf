/*
 * Author: esteldunedain
 * Cancel the drawing of the current line marker
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(drawing_isDrawing) = false;
if (count GVAR(drawing_tempLineMarker) > 0) then {
    deleteMarkerLocal (GVAR(drawing_tempLineMarker) select 0);
};
GVAR(drawing_tempLineMarker) = [];
