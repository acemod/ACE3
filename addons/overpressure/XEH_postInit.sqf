#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_1("settingsInit eh",GVAR(distanceCoefficient));
    if (GVAR(distanceCoefficient) <= 0) exitWith {};

    ["ace_overpressure", LINKFUNC(overpressureDamage)] call CBA_fnc_addEventHandler;

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(firedEHBB)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(firedEHOP)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
