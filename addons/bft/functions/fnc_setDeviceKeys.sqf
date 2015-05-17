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

private ["_deviceID","_keys"];
_deviceID = _this select 0;
_keys = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_keys isEqualTo (_data select 1) select 1) exitwith {};

["bft_updateDeviceKeys", [_deviceID, _keys]] call EFUNC(common,globalEvent);
