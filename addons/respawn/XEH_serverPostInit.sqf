#include "script_component.hpp"

["ace_settingsInitialized", {
    if (GVAR(RemoveDeadBodiesDisconnected)) then {
        addMissionEventHandler ["HandleDisconnect", {
            [{
                params ["_unit"];

                if (!alive _unit) then {
                    deleteVehicle _unit;
                };
            },
            _this, 4] call EFUNC(common,waitAndExecute);
            false
        }];
    };
}] call CBA_fnc_addEventHandler;
