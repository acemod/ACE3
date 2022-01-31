#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

// Remote setDead, internal usage only
[QGVAR(setDead), LINKFUNC(setDead)] call CBA_fnc_addEventHandler;
