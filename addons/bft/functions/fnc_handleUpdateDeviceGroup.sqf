#include "script_component.hpp"
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


params ["_deviceID", "_groupID"];

private _data = [_deviceID] call FUNC(getDeviceData);
private _previousGroup = _data select 2;
_previousGroup set [3, _groupID];

["bft_deviceDataChanged", [_data, false]] call CBA_fnc_localEvent;
