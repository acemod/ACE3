#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Clears all dev spheres and traces
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_frag_fnc_dev_clearTraces;
 *
 * Public: No
 */
for "_i" from 0 to count GVAR(dev_eventSpheres) - 1 do {
    deleteVehicle (GVAR(dev_eventSpheres)#_i);
};
GVAR(dev_eventSpheres) = [];

GVAR(dev_trackLines) = createHashMap;
GVAR(dev_hitBoxes) = createHashMap;
