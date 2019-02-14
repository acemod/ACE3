#include "script_component.hpp"

#include "XEH_PREP.hpp"

// cache refuel vehicles, see XEH_postInit.sqf
private _staticClasses = [];
private _dynamicClasses = [];

{
    private _fuelCargo = getNumber (_x >> QGVAR(fuelCargo));
    if (_fuelCargo > 0 || {_fuelCargo == REFUEL_INFINITE_FUEL}) then {
        private _sourceClass = configName _x;
        // check if we can use actions with inheritance
        if (
            !isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init") // addActionToClass relies on XEH init
            || {configName _x isKindOf "Static"} // CBA_fnc_addClassEventHandler doesn't support "Static" class
        ) then {
            if (2 == getNumber (_x >> "scope")) then {
                _staticClasses pushBackUnique _sourceClass;
            };
        } else {
            if (-1 == _dynamicClasses findIf {_sourceClass isKindOf _x}) then {
                _dynamicClasses pushBackUnique _sourceClass;
            };
        };
    };
} forEach ('true' configClasses (configFile >> "CfgVehicles"));

TRACE_2("compiled",count _staticClasses,count _dynamicClasses);
uiNamespace setVariable [QGVAR(cacheRefuelClasses), compileFinal str [_staticClasses, _dynamicClasses]];
