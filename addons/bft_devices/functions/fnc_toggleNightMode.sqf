/*
 * Author: Gundy
 *
 * Description:
 *   Toggle night mode
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_toggleNightMode;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_nightMode"];

_displayName = _this select 0;
_nightMode = [_displayName,"nightMode"] call FUNC(getSettings);

if (_nightMode != 2) then {
    if (_nightMode == 0) then {_nightMode = 1} else {_nightMode = 0};
    [_displayName,[["nightMode",_nightMode]]] call FUNC(setSettings);
};

true