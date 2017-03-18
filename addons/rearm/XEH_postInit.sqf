#include "script_component.hpp"

["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;
["vehicle", {
    params ["_unit"];
    [_unit] call FUNC(dropAmmo);
}] call CBA_fnc_addPlayerEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
};

[QGVAR(makeDummyEH), FUNC(makeDummy)] call CBA_fnc_addEventHandler;
[QGVAR(rearmEntireVehicleSuccessLocalEH), FUNC(rearmEntireVehicleSuccessLocal)] call CBA_fnc_addEventHandler;
[QGVAR(rearmSuccessLocalEH), FUNC(rearmSuccessLocal)] call CBA_fnc_addEventHandler;


#ifdef DEBUG_MODE_FULL
INFO("Showing CfgVehicles with vanilla transportAmmo");
{
    WARNING_2("Type [%1] needs config [transportAmmo: %2]", configName _x, getNumber (_x >> 'transportAmmo'));
} forEach (configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'transportAmmo')) > 0}", true]);
#endif
