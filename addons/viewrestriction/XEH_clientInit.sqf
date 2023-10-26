#include "script_component.hpp"

// Exit on Headless Client
if !(hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Exit if module is disabled
    if (XGVAR(mode) == 0) exitWith {};

    // Exit if all Selective Modes are Disabled
    if (XGVAR(mode) == 3 &&
        {XGVAR(modeSelectiveFoot) == 0} &&
        {XGVAR(modeSelectiveLand) == 0} &&
        {XGVAR(modeSelectiveAir) == 0} &&
        {XGVAR(modeSelectiveSea) == 0}/* &&
        {GVAR(modeSelectiveUAV) == 0}*/
    ) exitWith {
        WARNING("Selective mode enabled, but all sub-modes are disabled.")
    };

    // Exit if third person view is not available
    if (difficultyOption "thirdPersonView" == 0) exitWith {
        WARNING("View Restriction is enabled, but 3rd person is disabled with server difficulty.");
    };

    // Add Event Handler for changing camera - also happens on spawn
    ["cameraView", {
        [_this select 1, cameraOn] call FUNC(changeCamera);
    }] call CBA_fnc_addPlayerEventHandler;

    // Add Event Hander for exiting and entering a vehicle when on Selective mode - cameraView does not fire on simple enter/exit
    if (XGVAR(mode) == 3) then {
        ["vehicle", {
            [cameraView, _this select 1] call FUNC(changeCamera);
        }] call CBA_fnc_addPlayerEventHandler;
    };
}] call CBA_fnc_addEventHandler;
