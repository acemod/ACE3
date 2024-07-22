#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Compile and cache config UI
GVAR(configCache) = createHashMap;
call FUNC(compileConfigUI);

// Scripted API namespace
GVAR(elementsSet) = createHashMap;

// Attach all event handlers where UI has to be updated
["CBA_settingsInitialized", {
    // Initial settings
    [false] call FUNC(setElements);

    // On load and entering/exiting a vehicle
    ["ace_infoDisplayChanged", {
        // Selective UI Advanced
        // Defaults must be set in this EH to make sure controls are activated and advanced settings can be modified
        {
            [_x, missionNamespace getVariable (format [QGVAR(%1), _x]), false, !GVAR(allowSelectiveUI)] call FUNC(setAdvancedElement);
        } forEach (keys GVAR(configCache));

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
            private _nameNoPrefix = toLowerANSI (_name select [7]);
            if (_nameNoPrefix in GVAR(configCache)) then {
                [_nameNoPrefix, _value, true] call FUNC(setAdvancedElement);
            };
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

[QUOTE(ADDON), "AnimChanged", LINKFUNC(onAnimChanged), true] call EFUNC(common,addPlayerEH);
