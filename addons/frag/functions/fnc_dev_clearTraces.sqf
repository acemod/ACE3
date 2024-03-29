#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Clears all dev spheres and traces.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_dev_clearTraces
 *
 * Public: No
 */

{
    deleteVehicle _x;
} forEach GVAR(dev_eventSpheres);

GVAR(dev_eventSpheres) = [];

GVAR(dev_trackLines) = createHashMap;
GVAR(dev_hitBoxes) = createHashMap;
