#include "script_component.hpp"

["CBA_settingsInitialized", {

    TRACE_2("settingsInit eh",GVAR(backblastDistanceCoefficient),GVAR(overpressureDistanceCoefficient));

    // Both settings disabled, no need to initialize overpressure.
    if (GVAR(backblastDistanceCoefficient) == 0 && GVAR(overpressureDistanceCoefficient) == 0) exitWith {};
    
    ["ace_overpressure", LINKFUNC(overpressureDamage)] call CBA_fnc_addEventHandler;

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(firedEHBB)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(firedEHOP)] call CBA_fnc_addEventHandler;

    GVAR(cacheHash) = createHashMap;
}] call CBA_fnc_addEventHandler;
