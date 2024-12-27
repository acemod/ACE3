// ["vehicleTransportAmmo"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\rearm\dev\test_debugConfigs.sqf";

#include "..\script_component.hpp"

private _testPass = true;

INFO("Showing CfgVehicles with vanilla transportAmmo and without XEH");

private _badCfgVehicles = toString {
        getNumber (_x >> "scope") == 2
        && {getNumber (_x >> "transportAmmo") > 0}
        && {!isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init")}
};

{
    diag_log text format ["Class %1: %2 [%3] needs XEH", configName _x, configName inheritsFrom _x, configSourceMod _x];
    _testPass = false;
} forEach (_badCfgVehicles configClasses (configFile >> "CfgVehicles"));

_testPass
