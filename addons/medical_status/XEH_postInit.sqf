#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

[QGVAR(addInventoryActions), LINKFUNC(addInventoryActions)] call CBA_fnc_addEventHandler;

// Add inventory and open backpack actions to existing dead units
if (hasInterface) then {
    // EH above do not fire for dead units
    {
        [QGVAR(addInventoryActions), _x] call CBA_fnc_localEvent;
    } forEach allDeadMen;
};
