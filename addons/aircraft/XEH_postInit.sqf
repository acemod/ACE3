#include "script_component.hpp"

[QGVAR(droneModifyWaypoint), LINKFUNC(droneModifyWaypoint)] call CBA_fnc_addEventHandler;
[QGVAR(droneSetWaypoint), LINKFUNC(droneSetWaypoint)] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    ["ACE_controlledUAV", {
        params ["_UAV", "_seatAI", "_turret", "_position"];
        TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
        if (alive _UAV) then { 
            _this call FUNC(droneAddActions);
            _this call FUNC(droneAddMapHandler);
        };
    }] call CBA_fnc_addEventHandler;
};
