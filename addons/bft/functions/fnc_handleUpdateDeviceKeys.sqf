#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: keys <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_deviceID", "_keys"];

private _data = [_deviceID] call FUNC(getDeviceData);
private _encryption = _data select 1;
_encryption set [1, _keys];

["bft_deviceDataChanged", [_data, false]] call CBA_fnc_localEvent;
