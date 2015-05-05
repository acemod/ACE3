/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID", "_newOwner"];
_deviceID = _this select 0;
_newOwner = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_newOwner isEqualTo (_data select 5)) exitwith {};

["bft_updateDeviceOwner", [_deviceID, _newOwner]] call EFUNC(common,globalEvent);
