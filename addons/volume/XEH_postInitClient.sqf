#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Common", QXGVAR(toggle), [LLSTRING(KeybindName), LLSTRING(KeybindDescription)], "", {
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

    if (isNull objectParent _unit) then {
        call FUNC(restoreVolume);
    } else {
        call FUNC(lowerVolume);
    };
}] call CBA_fnc_addPlayerEventHandler;

// Self-calling reminder
[FUNC(remind), [], REMINDER_DELAY] call CBA_fnc_waitAndExecute;

// Restore volume on respawn
ace_player addEventHandler ["Respawn", FUNC(restoreVolume)];
