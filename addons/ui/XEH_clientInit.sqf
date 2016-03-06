//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["SettingsInitialized", {
    // Initial settings
    [true] call FUNC(setElements);

    // On load and entering/exiting a vehicle
    ["infoDisplayChanged", {
        // Selective UI Advanced
        // Defaults must be set in this EH to make sure controls are activated and advanced settings can be modified
        if (!GVAR(allowSelectiveUI)) then {
            {
                [_x, true] call FUNC(setAdvancedElement);
            } forEach ELEMENTS_ADVANCED;
        } else {
            {
                [_x] call FUNC(setAdvancedElement);
            } forEach ELEMENTS_ADVANCED;
        };
    }] call EFUNC(common,addEventHandler);

    ["SettingChanged", {
        params ["_name"];

        // Selective UI Basic
        if (_name in ELEMENTS_BASIC) then {
            call FUNC(setElements);
        };

        // Selective UI Advanced
        {
            _x params ["_element"];

            if (_name == _element) then {
                [_x] call FUNC(setAdvancedElement);
                TRACE_2("Setting Changed",_name,_element);
            };
        } forEach ELEMENTS_ADVANCED;
    }] call EFUNC(common,addEventHandler);

}] call EFUNC(common,addEventHandler);
