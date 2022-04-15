#include "script_component.hpp"

[QGVAR(droneModifyWaypoint), LINKFUNC(droneModifyWaypoint)] call CBA_fnc_addEventHandler;
[QGVAR(droneSetWaypoint), LINKFUNC(droneSetWaypoint)] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    ["ACE_controlledUAV", LINKFUNC(droneAddActions)] call CBA_fnc_addEventHandler;
};
