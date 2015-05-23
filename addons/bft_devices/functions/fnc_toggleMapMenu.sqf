/*
 * Author: Gundy
 *
 * Description:
 *   Toggle map menu on / off
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   _drawMapTools = ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_toggleMapMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_showMenu"];

_displayName = _this select 0;
_showMenu = [_displayName,"showMenu"] call FUNC(getSettings);
_showMenu = !_showMenu;
[_displayName,[["showMenu",_showMenu]]] call FUNC(setSettings);

true