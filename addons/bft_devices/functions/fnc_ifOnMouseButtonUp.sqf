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

// ignore function call if the interface has not finished setup
if (GVAR(ifOpenStart) || I_CLOSED) exitWith {true};

_function = _this select 0;
_control = _this select 1 select 0;
_mouseButton = _this select 1 select 1;
_display = ctrlParent _control;
_displayName = I_GET_NAME;

switch (_function) do {
    case "close": {
        [] call FUNC(ifClose);
    };
    case "btnACT": {
    };
    case "centerMapOnPlayerPosition": {
        [_displayName] call FUNC(centerMapOnPlayerPosition);
    };
    case "toggleMapType": {
        [_displayName] call FUNC(toggleMapType);
    };
    case "toggleMapTools": {
        [_displayName] call FUNC(toggleMapTools);
    };
    case "toggleIconText": {
        [_displayName] call FUNC(toggleIconText);
    };
    case "incTextSize": {
        [] call FUNC(incTextSize);
    };
    case "decTextSize": {
        [] call FUNC(decTextSize);
    };
    case "incBrightness": {
        [_displayName] call FUNC(incBrightness);
    };
    case "decBrightness": {
        [_displayName] call FUNC(decBrightness);
    };
    case "modeBFT": {
        [_displayName,[['mode','BFT']]] call FUNC(setSettings);
    };
    case "modeUAV": {
        [_displayName,[['mode','UAV']]] call FUNC(setSettings);
    };
    case "modeHCAM": {
        [_displayName,[['mode','HCAM']]] call FUNC(setSettings);
    };
    case "modeMESSAGE": {
        [_displayName,[['mode','MESSAGE']]] call FUNC(setSettings);
    };
    case "modeCOMPOSE": {
        [_displayName,[['mode','COMPOSE']]] call FUNC(setSettings);
    };
    case "modeDESKTOP": {
        [_displayName,[['mode','DESKTOP']]] call FUNC(setSettings);
    };
    case "toggleNightModeOrClose": {
        if (_mouseButton == 0) then {
            [_displayName] call FUNC(toggleNightMode);
        } else {
            if (_mouseButton == 1) then {
                [] call FUNC(ifClose);
            };
        };
    };
    case "toggleMapMenu": {
        [_displayName] call FUNC(toggleMapMenu);
    };
    case "toggleInterfaceMode": {
        [_displayName] call FUNC(toggleInterfaceMode);
    };
};

true