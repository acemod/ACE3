#include "script_component.hpp"

[QGVAR(addTurretMag), LINKFUNC(handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(handleRemoveTurretMag)] call CBA_fnc_addEventHandler;

GVAR(vehicleMagCache) = call CBA_fnc_createNamespace;

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    TRACE_1("ace_settingsInitialized",GVAR(onlyReloadEmpty));
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
[] call compile preprocessFileLineNumbers QPATHTOF(functions\dev_checkStaticWeapons.sqf);
#endif
