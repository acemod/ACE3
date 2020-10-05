#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;
[QGVAR(initialized), {
    params ["_unit"];
    _unit setVariable [QEGVAR(medical,initialized), true, true];
}] call CBA_fnc_addEventHandler;
