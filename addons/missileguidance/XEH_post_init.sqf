#include "script_component.hpp"

[QGVAR(handoff), {_this call FUNC(handleHandoff)}] call CBA_fnc_addEventHandler;

["ACE3 Weapons", QGVAR(cycleFireMode), localize LSTRING(CycleFireMode),
{
    [] call FUNC(cycleAttackProfileKeyDown);
    false
},
{
    false
},
[15, [false, true, false]], false] call CBA_fnc_addKeybind;  //Ctrl+Tab Key

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

