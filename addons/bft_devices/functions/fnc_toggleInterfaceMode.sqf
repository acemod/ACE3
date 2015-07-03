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
 *   [] call ace_bft_devices_fnc_toggleInterfaceMode;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_interfaceID","_mode"];

if (I_CLOSED) exitWith {true};

_displayName = I_GET_NAME;
_interfaceID = I_GET_ID;
_mode = [_interfaceID,"mode"] call FUNC(getSettings);

call {
    if (_displayName == QGVAR(GD300_dlg)) exitWith {
        call {
            if (_mode != "BFT") exitWith {_mode = "BFT"};
            _mode = "MESSAGE";
        };
    };
};
[_interfaceID,[["mode",_mode]]] call FUNC(setSettings);

true