/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: callsign <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_callsign);

private ["_data"];
_data = [_deviceID] call FUNC(getDeviceData);

if (count _data < 3) exitwith {};
if (count (_data select 2) < 3) exitwith {};
if (_callsign isEqualTo (_data select 2) select 2) exitwith {};

["bft_updateDeviceCallsign", [_deviceID, _callsign]] call EFUNC(common,globalEvent);
