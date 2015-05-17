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

private ["_deviceID","_groupID"];
_deviceID = _this select 0;
_groupID = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_groupID isEqualTo (_data select 2) select 3) exitwith {};

["bft_updateDeviceGroup", [_deviceID, _groupID]] call EFUNC(common,globalEvent);
