#include "script_component.hpp"

[QGVAR(handoff), {_this call FUNC(handleHandoff)}] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), localize LSTRING(CycleFireMode), {
    [] call FUNC(cycleAttackProfileKeyDown);
    false
}, {
    false
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key

// Each MCLOS argument is the vector which acceleration will be applied
["ACE3 Weapons", QGVAR(mclosUp), localize LSTRING(mclosUp), {
    [[0, 0, 1], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
}, {
    [[0, 0, -1], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
},
[0x48, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 8

["ACE3 Weapons", QGVAR(mclosDown), localize LSTRING(mclosDown), {
    [[0, 0, -1], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
}, {
    [[0, 0, 1], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
},
[0x50, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 2

["ACE3 Weapons", QGVAR(mclosLeft), localize LSTRING(mclosLeft), {
    [[1, 0, 0], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
}, {
    [[-1, 0, 0], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
},
[0x4D, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 6

["ACE3 Weapons", QGVAR(mclosRight), localize LSTRING(mclosRight), {
    [[-1, 0, 0], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
}, {
    [[1, 0, 0], ACE_PLAYER] call FUNC(mclosButtonPressed);
    false
},
[0x4B, [false, false, false]], false, 0] call CBA_fnc_addKeybind;  // Numpad 4

GVAR(dev_fnc_projectileCamera) = compile preprocessFileLineNumbers QPATHTOF(dev\projectileCamera.sqf);

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    ["turret", LINKFUNC(gps_setupVehicle), false] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", LINKFUNC(gps_setupVehicle), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

    // Add UAV Control Compatibility
    ["ACE_controlledUAV", {
        params ["_UAV", "_seatAI", "_turret", "_position"];
        TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
        if (!isNull _seatAI) then {
            [_seatAI] call FUNC(gps_setupVehicle);
        };
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;

