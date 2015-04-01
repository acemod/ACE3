/*
 * Author: PabstMirror
 * Gets all waypoints from the "device"
 * Device saving not implemented yet, just save to player object
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Waypoints <ARRAY>
 *
 * Example:
 * [["Hill 55", [41,324, 12]]] = [] call ace_microdagr_fnc_deviceGetWaypoint
 *
 * Public: No
 */
#include "script_component.hpp"

(ace_player getVariable [QGVAR(waypoints), []])
