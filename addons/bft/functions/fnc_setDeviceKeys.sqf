/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: keys <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_keys);

private ["_data"];
_data = [_deviceID] call FUNC(getDeviceData);

if (count _data < 2) exitwith {};
if (count (_data select 1) < 2) exitwith {};
if (_keys isEqualTo (_data select 1) select 1) exitwith {};

["bft_updateDeviceKeys", [_deviceID, _keys]] call EFUNC(common,globalEvent);
