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

private ["_deviceID","_elementType"];
_deviceID = _this select 0;
_elementType = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if ((_elementType select 0) isEqualTo (_data select 2) select 0) exitwith {};
if ((_elementType select 1) isEqualTo (_data select 2) select 1) exitwith {};

["bft_updateDeviceElementType", [_deviceID, _elementType]] call EFUNC(common,globalEvent);
