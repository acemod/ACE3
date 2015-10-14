#include "script_component.hpp"

// Exit on Headless Client
if (!hasInterface) exitWith {};

// Initial start of PFH if enabled
["SettingsInitialized", {
    if (GVAR(enabled)) then {
        call FUNC(show);
    };

    // Start PFH if setting enabled during playing
    // Added inside SettingsInitialized to prevent it running at initialization
    ["SettingChanged", {
        params ["_name", "_value"];
        if (_name == QGVAR(enabled) && {_value}) then {
            call FUNC(show);
        };
    }] call EFUNC(common,addEventHandler);
}] call EFUNC(common,addEventHandler);
