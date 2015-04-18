/*
 * Author: jaynus
 *
 * Arguments:
 * 
 *
 * Return Value:
 *
 *
 * Public: No
 */

#include "script_component.hpp"

// Create a synchronized, 30 second TTL event for litter
[QGVAR(createLitter), _this, 30] call EFUNC(common,syncedEvent);