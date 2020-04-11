// ["vehicleTransportFuel"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\refuel\dev\test_debugConfigs.sqf";

#include "\z\ace\addons\refuel\script_component.hpp"

private _testPass = true;

INFO("Showing CfgVehicles with transportFuel and without XEH");
private _badCfgVehicles = '
        2 == getNumber (_x >> "scope")
        && {0 < getNumber (_x >> "transportFuel")}
        && {!isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init")}
' configClasses (configFile >> "CfgVehicles");
{
    diag_log text format ["Class %1: %2 [%3] needs XEH", configName _x, configName inheritsFrom _x, configSourceMod _x];
} forEach _badCfgVehicles;

_testPass
