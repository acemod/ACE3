#include "script_component.hpp"

// Exit on Headless Client
if !(hasInterface) exitWith {};

["SettingsInitialized", {
    // Exit if module is disabled
    if (GVAR(mode) == 0) exitWith {};

    // Exit if all Selective Modes are Disabled
    if (GVAR(mode) == 3 &&
        {GVAR(modeSelectiveFoot) == 0} &&
        {GVAR(modeSelectiveVehicle) == 0} &&
        {GVAR(modeSelectiveAir) == 0} &&
        {GVAR(modeSelectiveUAV) == 0}) exitWith {ERROR("Selective mode enabled, but all sub-modes are disabled")};

    // Exit if third person view is not available
    if !(difficultyEnabled "3rdPersonView") exitWith {
        ACE_LOGWARNING("View Restriction is enabled, but 3rd person is disabled with server difficulty.");
    };

    // Make sure to load-in in correct mode
    call FUNC(changeCamera);

    // Add Event Handler for changing camera
    ["cameraViewChanged", {
        call FUNC(changeCamera);
    }] call EFUNC(common,addEventHandler);

    // Add Event Hander for exiting and entering a vehicle when on Selective mode
    if (GVAR(mode) == 3) then {
        ["playerVehicleChanged", {
            call FUNC(changeCamera);
        }] call EFUNC(common,addEventHandler);
    };
}] call EFUNC(common,addEventHandler);
