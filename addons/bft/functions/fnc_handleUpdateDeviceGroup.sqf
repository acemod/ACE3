/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: group ID <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_groupID);

private ["_data", "_previousGroup"];
_data = [_deviceID] call FUNC(getDeviceData);
_previousGroup = _data select 2;
_previousGroup set [3, _groupID];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
