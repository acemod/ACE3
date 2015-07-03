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

#include "script_component.hpp"

private ["_control","_display","_interfaceID","_function","_mouseButton","_mode"];

// ignore function call if the interface has not finished setup
if (GVAR(ifOpenStart) || I_CLOSED) exitWith {true};

_function = _this select 0;
_control = _this select 1 select 0;
_mouseButton = _this select 1 select 1;
_display = ctrlParent _control;
_interfaceID = I_GET_ID;

switch (_function) do {
    case "close": {
        [] call FUNC(ifClose);
    };
    case "btnACT": {
        _mode = [_interfaceID,"mode"] call FUNC(getSettings);
        call {
            if (_mode == "UAV") exitWith {[] call FUNC(remoteControlUAV)};
            if (_mode == "HCAM") exitWith {[_interfaceID,[["mode","HCAM_FULL"]]] call FUNC(setSettings)};
            if (_mode == "HCAM_FULL") exitWith {[_interfaceID,[["mode","HCAM"]]] call FUNC(setSettings)};
        };
    };
    case "centerMapOnPlayerPosition": {
        [_interfaceID] call FUNC(centerMapOnPlayerPosition);
    };
    case "toggleMapType": {
        [_interfaceID] call FUNC(toggleMapType);
    };
    case "toggleMapTools": {
        [_interfaceID] call FUNC(toggleMapTools);
    };
    case "toggleIconText": {
        [_interfaceID] call FUNC(toggleIconText);
    };
    case "incTextSize": {
        [] call FUNC(incTextSize);
    };
    case "decTextSize": {
        [] call FUNC(decTextSize);
    };
    case "incBrightness": {
        [_interfaceID] call FUNC(incBrightness);
    };
    case "decBrightness": {
        [_interfaceID] call FUNC(decBrightness);
    };
    case "modeBFT": {
        [_interfaceID,[['mode','BFT']]] call FUNC(setSettings);
    };
    case "modeUAV": {
        [_interfaceID,[['mode','UAV']]] call FUNC(setSettings);
    };
    case "modeHCAM": {
        [_interfaceID,[['mode','HCAM']]] call FUNC(setSettings);
    };
    case "modeMESSAGE": {
        [_interfaceID,[['mode','MESSAGE']]] call FUNC(setSettings);
    };
    case "modeCOMPOSE": {
        [_interfaceID,[['mode','COMPOSE']]] call FUNC(setSettings);
    };
    case "modeDESKTOP": {
        [_interfaceID,[['mode','DESKTOP']]] call FUNC(setSettings);
    };
    case "toggleNightModeOrClose": {
        if (_mouseButton == 0) then {
            [_interfaceID] call FUNC(toggleNightMode);
        } else {
            if (_mouseButton == 1) then {
                [] call FUNC(ifClose);
            };
        };
    };
    case "toggleMapMenu": {
        [_interfaceID] call FUNC(toggleMapMenu);
    };
    case "toggleInterfaceMode": {
        [] call FUNC(toggleInterfaceMode);
    };
};

true