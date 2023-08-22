#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

[QGVAR(addInventoryActions), LINKFUNC(addInventoryActions)] call CBA_fnc_addEventHandler;

// Add inventory and open backpack actions to units
// apply to all living and dead now
{
    [QGVAR(addInventoryActions), _x] call CBA_fnc_localEvent;
} forEach (allUnits + allDeadMen); 
// apply to all future units
["CAManBase", "init", LINKFUNC(addInventoryActions), true, [], false] call CBA_fnc_addClassEventHandler;
// Respawn is called locally
["CAManBase", "respawn", {
    params ["_unit"];
    if (!local _unit) exitWith {};

    [QGVAR(addInventoryActions), _unit] call CBA_fnc_globalEvent;
}, true] call CBA_fnc_addClassEventHandler;
