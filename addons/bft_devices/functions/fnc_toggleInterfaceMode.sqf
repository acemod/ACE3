/*
 * Author: Gundy
 *
 * Description:
 *   Toggle interface mode
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_toggleInterfaceMode;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_deviceID","_mode"];

if (I_CLOSED) exitWith {true};

_displayName = I_GET_NAME;
_deviceID = I_GET_DEVICE;
_mode = [_deviceID,"mode"] call FUNC(getSettings);

call {
    if (_displayName == QGVAR(GD300_dlg)) exitWith {
        call {
            if (_mode != "BFT") exitWith {_mode = "BFT"};
            _mode = "MESSAGE";
        };
    };
};
[_deviceID,[["mode",_mode]]] call FUNC(setSettings);

true