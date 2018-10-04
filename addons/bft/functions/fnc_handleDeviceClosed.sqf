#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
 */


GVAR(currentOpenedDevice) = [];
GVAR(registeredEncyptionKeys) = [];

[false] call FUNC(updateAvailableDevicesPosition);
