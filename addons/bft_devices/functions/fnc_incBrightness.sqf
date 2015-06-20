/*
 * Author: Gundy
 *
 * Description:
 *   Increases interface brightness
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_incBrightness;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_brightness", "_deviceID"];

_deviceID = _this select 0;
_brightness = [_deviceID,"brightness"] call FUNC(getSettings);
_brightness = _brightness + 0.1;
// make sure brightness is not larger than 1
if (_brightness > 1) then {_brightness = 1};
[_deviceID,[["brightness",_brightness]]] call FUNC(setSettings);

true