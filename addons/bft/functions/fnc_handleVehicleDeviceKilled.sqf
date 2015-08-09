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

private ["_data"];
params ["_deviceId"];

_data = [_deviceId] call FUNC(getDeviceData);

D_GET_DEVICE_STATE(_data) set [0, STATE_DESTROYED];
D_GET_DEVICE_STATE(_data) set [1, getPosASL vehicle D_GET_OWNER(_data)];
D_GET_DEVICE_STATE(_data) set [2, direction vehicle D_GET_OWNER(_data)];
D_GET_DEVICE_STATE(_data) set [3, ACE_time];

