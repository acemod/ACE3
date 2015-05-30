/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <STRING>
 * 1: data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_callsign);

private ["_data", "_deviceAssignableInfo"];
_data = [_deviceID] call FUNC(getDeviceData);
_deviceAssignableInfo = _data select 2;
_deviceAssignableInfo set [2, _callsign];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
