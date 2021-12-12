#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Cycles camera thermal mode (if avaliable)
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_cameraNamespace", "_viewMode"];

private _userInCamera = [] call FUNC(camera_userInCamera);

if (_userInCamera) then {
    camUseNVG false;
    false setCamUseTI (_cameraNamespace getVariable [QGVAR(tiMode), 0]);
};

private _thermalMode = ["normal", "nvg", "white_hot_black_cold", "black_hot_white_cold", "light_green_hot_dark_green_cold", "black_hot_green_cold", "light_red_hot_dark_red_cold", "black_hot_red_cold", "white_hot_red_cold", "predator"] findIf { _viewMode isEqualTo _x };
if (_thermalMode > 1) then {
    if (_userInCamera) then {
        true setCamUseTI (_thermalMode - 2);
    };
};
if (_thermalMode == 1) then {
    if (_userInCamera) then {
        camUseNVG true;
    };
};
_cameraNamespace setVariable [QGVAR(tiMode), _thermalMode - 2];
_cameraNamespace setVariable [QGVAR(tiModeString), _viewMode];
