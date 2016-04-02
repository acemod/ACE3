#include "script_component.hpp"

["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CFUNC(addEventHandler);
["playerVehicleChanged", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}] call CFUNC(addEventHandler);

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
};
