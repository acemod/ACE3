/*
 * Author: Gundy
 *
 * Description:
 *   Decrease interface brightness
 *
 * Arguments:
 *   0: Interface ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["interfaceID"] call ace_bft_devices_fnc_decBrightness;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_brightness", "_interfaceID"];

_interfaceID = _this select 0;
_brightness = [_interfaceID,"brightness"] call FUNC(getSettings);
_brightness = _brightness - 0.1;
// make sure brightness is not larger than 0.5
if (_brightness < 0.5) then {_brightness = 0.5};
[_interfaceID,[["brightness",_brightness]]] call FUNC(setSettings);

true