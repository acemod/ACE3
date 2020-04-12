#include "script_component.hpp"

#include "XEH_PREP.hpp"

// cache refuel vehicles, see XEH_postInit.sqf
private _staticClasses = [];
private _baseStaticClasses = [];
private _baseDynamicClasses = [];

{
    private _transportFuel = getNumber (_x >> "transportFuel");
    private _fuelCargo = [_x >> QGVAR(fuelCargo), "NUMBER", _transportFuel] call CBA_fnc_getConfigEntry;
    if (_fuelCargo > 0 || {_fuelCargo == REFUEL_INFINITE_FUEL}) then {
        private _sourceClass = configName _x;
        private _noXEH = !isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init");
        private _isPublic = 2 == getNumber (_x >> "scope");
        // check if we can use actions with inheritance
        if (
            _noXEH // addActionToClass relies on XEH init
            || {_sourceClass isKindOf "Static"} // CBA_fnc_addClassEventHandler doesn't support "Static" class
        ) then {
            if (_isPublic) then {
                if (_noXEH) then {
                    WARNING_3("Class %1: %2 [%3] needs XEH",_sourceClass,configName inheritsFrom _x,configSourceMod _x);
                };
                _staticClasses pushBack _sourceClass;
                if (-1 == _baseStaticClasses findIf {_sourceClass isKindOf _x}) then {
                    _baseStaticClasses pushBack _sourceClass;
                };
            };
        } else {
            if (-1 == _baseDynamicClasses findIf {_sourceClass isKindOf _x}) then {
                _baseDynamicClasses pushBack _sourceClass;
            };
        };
        if (_isPublic) then {
            uiNamespace setVariable [format [QGVAR(cacheRefuelCargo_%1), _sourceClass], compileFinal str _fuelCargo];
        };
    };
} forEach ('true' configClasses (configFile >> "CfgVehicles"));

TRACE_3("compiled",count _staticClasses,count _baseStaticClasses,count _baseDynamicClasses);
uiNamespace setVariable [QGVAR(cacheRefuelClasses), compileFinal str [_staticClasses, _baseStaticClasses, _baseDynamicClasses]];
