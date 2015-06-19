/*
 * Author: Gundy
 *
 * Description:
 *   Called from various interface buttons and executes the appropriate function
 *
 * Arguments:
 *   0: Function to trigger <STRING>
 *   1: _this variable from the onMouseButtonDown event <ARRAY>
 *     0: Interface control <OBJECT>
 *     1: Mouse button pressed <INTEGER>
 *     2: 
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["textIncrease",_this] call ace_bft_devices_fnc_ifOnMouseButtonUp;
 *
 * Public: No
 */

private [];

#include "script_component.hpp"

private ["_control","_display","_deviceID","_function","_mouseButton"];

// ignore function call if the interface has not finished setup
if (GVAR(ifOpenStart) || I_CLOSED) exitWith {true};

_function = _this select 0;
_control = _this select 1 select 0;
_mouseButton = _this select 1 select 1;
_display = ctrlParent _control;
_deviceID = I_GET_DEVICE;

switch (_function) do {
    case "close": {
        [] call FUNC(ifClose);
    };
    case "btnACT": {
    };
    case "centerMapOnPlayerPosition": {
        [_deviceID] call FUNC(centerMapOnPlayerPosition);
    };
    case "toggleMapType": {
        [_deviceID] call FUNC(toggleMapType);
    };
    case "toggleMapTools": {
        [_deviceID] call FUNC(toggleMapTools);
    };
    case "toggleIconText": {
        [_deviceID] call FUNC(toggleIconText);
    };
    case "incTextSize": {
        [] call FUNC(incTextSize);
    };
    case "decTextSize": {
        [] call FUNC(decTextSize);
    };
    case "incBrightness": {
        [_deviceID] call FUNC(incBrightness);
    };
    case "decBrightness": {
        [_deviceID] call FUNC(decBrightness);
    };
    case "modeBFT": {
        [_deviceID,[['mode','BFT']]] call FUNC(setSettings);
    };
    case "modeUAV": {
        [_deviceID,[['mode','UAV']]] call FUNC(setSettings);
    };
    case "modeHCAM": {
        [_deviceID,[['mode','HCAM']]] call FUNC(setSettings);
    };
    case "modeMESSAGE": {
        [_deviceID,[['mode','MESSAGE']]] call FUNC(setSettings);
    };
    case "modeCOMPOSE": {
        [_deviceID,[['mode','COMPOSE']]] call FUNC(setSettings);
    };
    case "modeDESKTOP": {
        [_deviceID,[['mode','DESKTOP']]] call FUNC(setSettings);
    };
    case "toggleNightModeOrClose": {
        if (_mouseButton == 0) then {
            [_deviceID] call FUNC(toggleNightMode);
        } else {
            if (_mouseButton == 1) then {
                [] call FUNC(ifClose);
            };
        };
    };
    case "toggleMapMenu": {
        [_deviceID] call FUNC(toggleMapMenu);
    };
    case "toggleInterfaceMode": {
        [] call FUNC(toggleInterfaceMode);
    };
};

true