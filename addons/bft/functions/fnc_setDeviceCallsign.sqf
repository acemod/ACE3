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

private ["_deviceID","_callsign"];
_deviceID = _this select 0;
_callsign = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_callsign isEqualTo (_data select 2) select 2) exitwith {};

["bft_updateDeviceCallsign", [_deviceID, _callsign]] call EFUNC(common,globalEvent);
