#include "script_component.hpp"

if (hasInterface) then {
    GVAR(pfID) = -1;
    GVAR(generators) = [];

    GVAR(config) = configFile >> "RscTitles" >> QGVAR(infoDisplay) >> "controlPrefabs";
    GVAR(config_line) = GVAR(config) >> "line";
    GVAR(lineHeight) = getNumber (GVAR(config_line) >> "h");
    GVAR(lineWidth) = getNumber (GVAR(config_line) >> "w");
    GVAR(itemWidth) = getNumber (GVAR(config) >> "icon" >> "w") / 1.25;

    ["CBA_settingsInitialized", {
        ["turret", LINKFUNC(showVehicleHud), false] call CBA_fnc_addPlayerEventHandler;
        ["vehicle", LINKFUNC(showVehicleHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

        // Add UAV Control Compatibility
        ["ACE_controlledUAV", {
            params ["_UAV", "_seatAI", "_turret", "_position"];
            TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
            if (isNull _seatAI) then {
                [ace_player] call FUNC(showVehicleHud);
            } else {
                [_seatAI] call FUNC(showVehicleHud);
            };
        }] call CBA_fnc_addEventHandler;

        [] call FUNC(registerDefaultHud);
    }] call CBA_fnc_addEventHandler;
};

