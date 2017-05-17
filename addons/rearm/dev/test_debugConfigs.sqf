// execVM "z\ace\addons\common\rearm\test_debugConfigs.sqf";

#include "\z\ace\addons\rearm\script_component.hpp"

private _testPass = true;

INFO("Showing CfgVehicles with vanilla transportAmmo");
{
    WARNING_2("Type [%1] needs config [transportAmmo: %2]", configName _x, getNumber (_x >> 'transportAmmo'));
} forEach (configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'transportAmmo')) > 0}", true]);

_testPass
