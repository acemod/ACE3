// execVM "z\ace\addons\common\refuel\test_debugConfigs.sqf";

#include "\z\ace\addons\refuel\script_component.hpp"

private _testPass = true;

diag_log text format ["[ACE-refuel] Showing CfgVehicles with vanilla transportFuel"];
private _fuelTrucks = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'transportFuel')) > 0}", true];
{
    if ((configName _x) isKindOf "Car") then {
        diag_log text format ["Car [%1] needs config [fuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    } else {
        diag_log text format ["Non-car? [%1] needs config [fuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    };
} forEach _fuelTrucks;

_testPass
