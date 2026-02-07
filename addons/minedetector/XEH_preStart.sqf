#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Cache detectable classes
private _detectableClasses = [];

{
    if ((getNumber (_x >> QGVAR(detectable))) == 1) then {
        _detectableClasses pushBack configName _x;
    };
} forEach ("true" configClasses (configFile >> "CfgVehicles"));

{
    if ((getNumber (_x >> QGVAR(detectable))) == 1) then {
        _detectableClasses pushBack configName _x;
    };
} forEach ("true" configClasses (configFile >> "CfgAmmo"));

TRACE_1("built cache",count _detectableClasses);
uiNamespace setVariable [QGVAR(detectableClasses), compileFinal (_detectableClasses createHashMapFromArray [])];
