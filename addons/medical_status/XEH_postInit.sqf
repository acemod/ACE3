#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

[QGVAR(addInventoryActions), LINKFUNC(addInventoryActions)] call CBA_fnc_addEventHandler;

// Add inventory and open backpack actions to units
["CAManBase", "init", LINKFUNC(addInventoryActions), true, [], true] call CBA_fnc_addClassEventHandler;

// Respawn is called locally
["CAManBase", "respawn", {
    params ["_unit"];

    if (!local _unit) exitWith {};

    [QGVAR(addInventoryActions), _unit] call CBA_fnc_globalEvent;
}, true] call CBA_fnc_addClassEventHandler;

// EH above do not fire for dead units
{
    [QGVAR(addInventoryActions), _x] call CBA_fnc_localEvent;
} forEach allDeadMen;
