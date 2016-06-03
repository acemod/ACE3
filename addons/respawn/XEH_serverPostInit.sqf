#include "script_component.hpp"

["SettingsInitialized", {
    if (GVAR(RemoveDeadBodiesDisconnected)) then {
        addMissionEventHandler ["HandleDisconnect", {
            [{
                params ["_unit"];

                if (!alive _unit) then {
                    deleteVehicle _unit;
                };
            },
            _this, 4] call CBA_fnc_waitAndExecute;
            false
        }];
    };
}] call EFUNC(common,addEventHandler);
