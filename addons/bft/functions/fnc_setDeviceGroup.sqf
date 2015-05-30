/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: group ID <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_groupID);

private ["_data"];
_data = [_deviceID] call FUNC(getDeviceData);

if (count _data < 3) exitwith {};
if (count (_data select 2) < 4) exitwith {};
if (_groupID isEqualTo (_data select 2) select 3) exitwith {};

["bft_updateDeviceGroup", [_deviceID, _groupID]] call EFUNC(common,globalEvent);
