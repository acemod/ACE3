/*
 * Author: Gundy
 *
 * Description:
 *   Toggle map menu on / off
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_toggleMapMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_showMenu"];

_deviceID = _this select 0;
_showMenu = [_deviceID,"showMenu"] call FUNC(getSettings);
_showMenu = !_showMenu;
[_deviceID,[["showMenu",_showMenu]]] call FUNC(setSettings);

true