#include "script_component.hpp"

["medical_onUnconscious", {_this call FUNC(handleUnconscious)}] call EFUNC(common,addEventHandler);
["playerVehicleChanged", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}] call EFUNC(common,addEventHandler);

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
};

[QGVAR(makeDummyEH), {
    _this call FUNC(makeDummy);
}] call EFUNC(common,addEventHandler);

[QGVAR(rearmEntireVehicleSuccessLocalEH), {
    _this call FUNC(rearmEntireVehicleSuccessLocal);
}] call EFUNC(common,addEventHandler);

[QGVAR(rearmSuccessLocalEH), {
    _this call FUNC(rearmSuccessLocal);
}] call EFUNC(common,addEventHandler);
