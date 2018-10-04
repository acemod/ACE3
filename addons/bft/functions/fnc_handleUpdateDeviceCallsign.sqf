#include "script_component.hpp"
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


params ["_deviceID", "_callsign"];

private _data = [_deviceID] call FUNC(getDeviceData);
private _deviceAssignableInfo = _data select 2;
_deviceAssignableInfo set [2, _callsign];

["bft_deviceDataChanged", [_data, false]] call CBA_fnc_localEvent;
