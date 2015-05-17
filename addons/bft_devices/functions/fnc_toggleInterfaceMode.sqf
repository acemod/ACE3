/*
 * Author: Gundy
 *
 * Description:
 *   Toggle interface mode
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   _drawMapTools = ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_toggleInterfaceMode;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_mode"];

_displayName = _this select 0;
_mode = [_displayName,"mode"] call FUNC(getSettings);

call {
    if (_displayName == QGVAR(GD300_dlg)) exitWith {
        call {
            if (_mode != "BFT") exitWith {_mode = "BFT"};
            _mode = "MESSAGE";
        };
    };
};
[_displayName,[["mode",_mode]]] call FUNC(setSettings);

true