/*
 * Author: Gundy
 *
 * Description:
 *   Toggle drawing of map tools
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   Draw map tools <BOOL>
 *
 * Example:
 *   _drawMapTools = ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_toggleMapTools;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_newMapTools"];

_displayName = _this select 0;
_newMapTools = !([_displayName,"mapTools"] call FUNC(getSettings));
[_displayName,[["mapTools",_newMapTools]]] call FUNC(setSettings);

_newMapTools