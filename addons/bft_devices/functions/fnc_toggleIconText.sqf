/*
 * Author: Gundy
 *
 * Description:
 *   Toggle text next to BFT icons
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_fnc_toggleIconText;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID"];

_deviceID = _this select 0;
if (GVAR(showBFTtext)) then {GVAR(showBFTtext) = false} else {GVAR(showBFTtext) = true};
[_deviceID,[["showIconText",GVAR(showBFTtext)]]] call FUNC(setSettings);

true