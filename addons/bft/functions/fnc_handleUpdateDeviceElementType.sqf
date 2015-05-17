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

private ["_deviceID", "_elementType", "_data", "_assignableInformation"];
_deviceID = _this select 0;
_elementType = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);
_assignableInformation = _data select 2;
_assignableInformation set [0, _elementType select 0];
_assignableInformation set [1, _elementType select 1];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
