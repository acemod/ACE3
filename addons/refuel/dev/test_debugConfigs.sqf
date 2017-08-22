// ["vehicleTransportFuel"] call ace_common_fnc_runTests;
// execVM "z\ace\addons\refuel\dev\test_debugConfigs.sqf";

#include "\z\ace\addons\refuel\script_component.hpp"

private _testPass = true;

diag_log text format ["[ACE-refuel] Showing CfgVehicles with vanilla transportFuel"];
private _fuelTrucks = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'transportFuel')) > 0}", true];
{
    if ((configName _x) isKindOf "Car") then {
        diag_log text format ["Car [%1] needs config [transportFuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    } else {
        diag_log text format ["Non-car? [%1] needs config [transportFuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    };
} forEach _fuelTrucks;

_testPass
