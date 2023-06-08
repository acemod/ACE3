#include "script_component.hpp"
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


if (I_CLOSED) exitWith {true};

private _displayName = I_GET_NAME;
private _interfaceID = I_GET_ID;
private _mode = [_interfaceID,"mode"] call FUNC(getSettings);

call {
    if (_displayName == QEGVAR(bft_device_gd300,GD300_dlg)) exitWith {
        call {
            if (_mode != "BFT") exitWith {_mode = "BFT"};
            _mode = "MESSAGE";
        };
    };
};
[_interfaceID, [["mode",_mode]]] call FUNC(setSettings);

true
