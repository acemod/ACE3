/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: element type <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_deviceID", "_elementType"];

private _data = [_deviceID] call FUNC(getDeviceData);
private _assignableInformation = _data select 2;
_assignableInformation set [0, _elementType select 0];
_assignableInformation set [1, _elementType select 1];

["bft_deviceDataChanged", [_data, false]] call CBA_fnc_localEvent;
