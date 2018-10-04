/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: device data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_deviceID", "_deviceData"];

private _data = [_deviceID] call FUNC(getDeviceData);

if (_data isEqualTo []) exitwith {};
if (_deviceData isEqualTo (_data select 3)) exitwith {};

["bft_updateDeviceData", [_deviceID, _deviceData]] call CBA_fnc_globalEvent;
