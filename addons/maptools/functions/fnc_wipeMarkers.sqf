#include "../script_component.hpp"
/*
 * Author: LorenLuke
 * Delete all markers on the plotting board.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_maptools_fnc_wipeMarkers
 *
 * Public: No
 */

{
    deleteMarker _x;
} forEach (keys GVAR(plottingBoard_markers));

// Reset list
GVAR(plottingBoard_markers) = createHashMap;
