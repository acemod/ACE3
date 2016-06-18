#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    // Initial settings
    [false] call FUNC(setElements);

    // On load and entering/exiting a vehicle
    ["ace_infoDisplayChanged", {
        // Selective UI Advanced
        // Defaults must be set in this EH to make sure controls are activated and advanced settings can be modified
        private _force = [true, false] select (GVAR(allowSelectiveUI));
        {
            private _name = configName _x;
            [_name, missionNamespace getVariable (format [QGVAR(%1), _name]), false, _force] call FUNC(setAdvancedElement);
        } forEach ("true" configClasses (configFile >> "ACE_UI"));

        // Execute local event for when it's safe to modify UI through this API
        // infoDisplayChanged can execute multiple times, make sure it only happens once
        if (!GVAR(interfaceInitialized)) then {
            [QGVAR(InterfaceInitialized), []] call CBA_fnc_localEvent;
            GVAR(interfaceInitialized) = true;
        };
    }] call CBA_fnc_addEventHandler;

    // On changing settings
    ["ace_settingChanged", {
        params ["_name"];

        if (_name in ELEMENTS_BASIC) then {
            [true] call FUNC(setElements);
        } else {
            if (isClass (configFile >> "ACE_UI" >> _name select [7])) then {
                [_name select [7], missionNamespace getVariable _name, true] call FUNC(setAdvancedElement);
            };
        };
    }] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
