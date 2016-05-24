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
        private _force = [true, false] select (GVAR(allowSelectiveUI));
        {
            [_x select 3, missionNamespace getVariable (_x select 3), _force] call FUNC(setAdvancedElement);
        } forEach ELEMENTS_ADVANCED;

        // Execute local event for when it's safe to modify UI through this API
        // infoDisplayChanged can execute multiple times, make sure it only happens once
        if (!GVAR(interfaceInitialized)) then {
            ["InterfaceInitialized", []] call EFUNC(common,localEvent);
            GVAR(interfaceInitialized) = true;
        };
    }] call EFUNC(common,addEventHandler);

    // On changing settings
    ["SettingChanged", {
        params ["_name"];

        // Selective UI Basic
        if (_name in ELEMENTS_BASIC) then {
            [false] call FUNC(setElements);
        } else { // Selective UI Advanced
            // Get show/hide boolean from mission namespace
            private _show = missionNamespace getVariable _name;

            // Get show/hide boolean from a set element if set via API
            if ([_name, !_show] in GVAR(elementsSet)) exitWith {
                [LSTRING(Disabled), 2] call EFUNC(common,displayTextStructured);
            };

            [_name, _show] call FUNC(setAdvancedElement);
            TRACE_2("Setting Changed",_name,_show);
        };
    }] call EFUNC(common,addEventHandler);

}] call EFUNC(common,addEventHandler);
