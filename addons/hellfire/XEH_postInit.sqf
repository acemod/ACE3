#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    ["turret", LINKFUNC(setupVehicle), false] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", LINKFUNC(setupVehicle), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

    // Add UAV Control Compatibility
    ["ACE_controlledUAV", {
        params ["_UAV", "_seatAI", "_turret", "_position"];
        TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
        if (!isNull _seatAI) then {
            [_seatAI] call FUNC(setupVehicle);
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
