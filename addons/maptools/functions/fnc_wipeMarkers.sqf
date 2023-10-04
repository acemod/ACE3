#include "../script_component.hpp"
/*
 * Author: LorenLuke
 * Delete all markers on the Plotting Board. 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ACE_maptools_fnc_wipeMarkers
 *
 * Public: No
 */

{
    deleteMarker _x;
    GVAR(plottingBoard_markers) deleteAt _x; 
} forEach GVAR(plottingBoard_markers);
