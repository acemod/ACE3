#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Compile and cache config UI
GVAR(configCache) = call CBA_fnc_createNamespace;
call FUNC(compileConfigUI);

// Scripted API namespace
GVAR(elementsSet) = call CBA_fnc_createNamespace;

// Attach all event handlers where UI has to be updated
["CBA_settingsInitialized", {
    // Initial settings
    [false] call FUNC(setElements);

    // On load and entering/exiting a vehicle
    ["ace_infoDisplayChanged", {
        // Selective UI Advanced
        // Defaults must be set in this EH to make sure controls are activated and advanced settings can be modified
        private _force = [true, false] select (GVAR(allowSelectiveUI));
        {
            [_x, missionNamespace getVariable (format [QGVAR(%1), _x]), false, _force] call FUNC(setAdvancedElement);
        } forEach (allVariables GVAR(configCache));

        // Execute local event for when it's safe to modify UI through this API
        // infoDisplayChanged can execute multiple times, make sure it only happens once
        if (!GVAR(interfaceInitialized)) then {
            [QGVAR(InterfaceInitialized), []] call CBA_fnc_localEvent;
            GVAR(interfaceInitialized) = true;
        };
    }] call CBA_fnc_addEventHandler;

    // On changing settings
    ["CBA_SettingChanged", {
        params ["_name", "_value"];
        if (_name select [0, 7] != "ace_ui_") exitWith {};

        if (_name in ELEMENTS_BASIC) then {
            [true] call FUNC(setElements);
        } else {
            private _nameNoPrefix = toLower (_name select [_delimPos]);
            private _cachedElement = GVAR(configCache) getVariable _nameNoPrefix;
            if (!isNil "_cachedElement") then {
                [_nameNoPrefix, _value, true] call FUNC(setAdvancedElement);
            };
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

["unit", FUNC(handlePlayerChanged), true] call CBA_fnc_addPlayerEventHandler;
