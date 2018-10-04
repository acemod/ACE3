#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 * 1: data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_deviceID", "_newData"];

private _data = [_deviceID] call FUNC(getDeviceData);
_data set [3, _newData];

// ["bft_deviceDataChanged", [_data, false]] call CBA_fnc_localEvent;
