#include "script_component.hpp"

["ace_medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;
["ace_playerVehicleChanged", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}] call CBA_fnc_addEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
};
