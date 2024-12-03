#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache detectable classes, see XEH_postInit.sqf
private _detectableClasses = [];
{
    if ((getNumber (_x >> QGVAR(detectable))) == 1) then {
        _detectableClasses pushBackUnique configName _x;
    };
} forEach (configProperties [configFile >> "CfgVehicles", "isClass _x", true]);
{
    if ((getNumber (_x >> QGVAR(detectable))) == 1) then {
        _detectableClasses pushBackUnique configName _x;
    };
} forEach (configProperties [configFile >> "CfgAmmo", "isClass _x", true]);

TRACE_1("built cache",count _detectableClasses);
uiNamespace setVariable [QGVAR(detectableClasses), compileFinal (_detectableClasses createHashMapFromArray [])];
