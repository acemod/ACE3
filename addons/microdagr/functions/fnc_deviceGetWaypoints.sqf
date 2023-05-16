#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets all waypoints from the "device"
 * Device saving not implemented yet, just save to player object
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Waypoints <ARRAY>
 *
 * Example:
 * [["Hill 55", [41,324, 12]]] = [] call ace_microdagr_fnc_deviceGetWaypoints
 *
 * Public: No
 */

(ACE_player getVariable [QGVAR(waypoints), []])
