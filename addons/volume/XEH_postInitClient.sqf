#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACEX", QXGVAR(toggle), [LLSTRING(KeybindName), LLSTRING(KeybindDescription)], "", {
    if (!XGVAR(enabled)) exitWith {
        if (GVAR(isLowered)) then {
            call FUNC(restoreVolume);
        };
    };

    if (GVAR(isLowered)) then {
        call FUNC(restoreVolume);
    } else {
        call FUNC(lowerVolume);
    };

    false
}] call CBA_fnc_addKeybind;

["vehicle", {
    params ["_unit"];

    if (!XGVAR(lowerInVehicles)) exitWith {};

    if (vehicle _unit != _unit) then {
        call FUNC(lowerVolume);
    } else {
        call FUNC(restoreVolume);
    };
}] call CBA_fnc_addPlayerEventHandler;

// Self-calling reminder
[FUNC(remind), [], REMINDER_DELAY] call CBA_fnc_waitAndExecute;

// Restore volume on respawn
ace_player addEventHandler ["Respawn", FUNC(restoreVolume)];
