/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID", "_callsign", "_data", "_deviceAssignableInfo"];
_deviceID = _this select 0;
_callsign = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);
_deviceAssignableInfo = _data select 2;
_deviceAssignableInfo set [2, _callsign];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
