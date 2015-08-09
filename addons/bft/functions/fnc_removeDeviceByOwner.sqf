/*
 * Author: Glowbal
 * Remove all devices of given owner in the available devices collection
 *
 * Arguments:
 * 0: Device Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_owner", "_deviceOwner", "_device"];
params ["_deviceData"];
_owner = D_GET_OWNER(_deviceData);

for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
    _device = GVAR(availableDevices) select _i;
    _deviceOwner = AD_GET_OWNER(_device);
    if (_owner == _deviceOwner) then {
        GVAR(availableDevices) deleteAt _i;
        _i = _i - 1;
    };
};
