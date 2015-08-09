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

#include "script_component.hpp"

GVAR(currentOpenedDevice) = [];
GVAR(registeredEncyptionKeys) = [];

[false] call FUNC(updateAvailableDevicesPosition);