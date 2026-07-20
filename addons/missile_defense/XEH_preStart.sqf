#include "script_component.hpp"

#include "XEH_PREP.hpp"

GVAR(projectilesToIntercept) = createHashMap;

#define SIM_TYPES ["shotMissile", "shotShell", "shotRocket"]

{
    private _simulation = getText (_x >> "simulation");
    if (_simulation in SIM_TYPES) then {
        GVAR(projectilesToIntercept) set [configName _x, true];
    };
    private _submunition = getText (_x >> "submunitionAmmo");
    if (_submunition != "") then {
        private _submunitionConfig = configFile >> "CfgAmmo" >> _submunition;
        private _simulation = getText (_submunitionConfig >> "simulation");
        if (_simulation in SIM_TYPES) then {
            GVAR(projectilesToIntercept) set [configName _x, true];
        };
    };
} forEach ("true" configClasses (configFile >> "CfgAmmo"));

uiNamespace setVariable [QGVAR(projectilesToIntercept), compileFinal GVAR(projectilesToIntercept)];
