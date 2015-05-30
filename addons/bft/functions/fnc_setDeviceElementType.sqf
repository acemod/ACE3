/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: elementType <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_elementType);

private ["_data"];
_data = [_deviceID] call FUNC(getDeviceData);

if (count _data < 3) exitwith {};
if (count (_data select 2) < 2) exitwith {};
if ((_elementType select 0) isEqualTo (_data select 2) select 0) exitwith {};
if ((_elementType select 1) isEqualTo (_data select 2) select 1) exitwith {};

["bft_updateDeviceElementType", [_deviceID, _elementType]] call EFUNC(common,globalEvent);
