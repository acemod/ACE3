#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: new owner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_deviceID", "_newOwner"];

private _data = [_deviceID] call FUNC(getDeviceData);

if (count _data < 6) exitwith {};
if (_newOwner isEqualTo (_data select 5)) exitwith {};

["bft_updateDeviceOwner", [_deviceID, _newOwner]] call CBA_fnc_globalEvent;
