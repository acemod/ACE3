#include "script_component.hpp"

["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call EFUNC(common,addEventHandler);

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
};

// @todo move to common?
[QGVAR(setVectorDirAndUp), {
    params ["_vehicle", "_vectorDirAndUp"];

    if (local _vehicle) then {
        (_this select 0) setVectorDirAndUp (_this select 1)
    };
}] call EFUNC(common,addEventHandler);

[QGVAR(setVehicleHitPointDamage), {
    (_this select 0) setHitPointDamage (_this select 1);
}] call EFUNC(common,addEventHandler);

[QGVAR(resetLocal), {
    _this call FUNC(resetLocal);
}] call EFUNC(common,addEventHandler);
