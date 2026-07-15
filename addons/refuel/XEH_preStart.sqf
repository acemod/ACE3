#include "script_component.hpp"

#include "XEH_PREP.hpp"

// cache refuel vehicles, see XEH_postInit.sqf
private _staticClasses = [];
private _baseDynamicClasses = [];
private _cacheRefuelCargo = createHashMap;

{
    private _transportFuel = getNumber (_x >> "transportFuel");
    private _fuelCargo = [_x >> QGVAR(fuelCargo), "NUMBER", _transportFuel] call CBA_fnc_getConfigEntry;

    if (_fuelCargo in [0, REFUEL_DISABLED_FUEL]) then {continue};

    private _sourceClass = configName _x;
    private _hasXEH = isText (_x >> "EventHandlers" >> "CBA_Extended_EventHandlers" >> "init");
    private _isPublic = getNumber (_x >> "scope") == 2;
    private _isStatic = _sourceClass isKindOf "Static";

    if (_isPublic) then {
        _cacheRefuelCargo set [_sourceClass, _fuelCargo];
    };

    // check if we can use actions with inheritance
    if (
        _hasXEH // addActionToClass relies on XEH init
        && {!_isStatic} // CBA_fnc_addClassEventHandler doesn't support "Static" class
    ) then {
        if (_baseDynamicClasses findIf {_sourceClass isKindOf _x} == -1) then {
            _baseDynamicClasses pushBack _sourceClass;
            TRACE_3("dynamic",_sourceClass,_transportFuel,_fuelCargo);
        };
        continue;
    };

    if (!_isPublic) then {continue};

    if (!_hasXEH) then {
        WARNING_3("Class %1: %2 %3 needs XEH",_sourceClass,configName inheritsFrom _x,configSourceModList _x);
    };
    if (_isStatic && {_transportFuel == 0}) then {
        WARNING_3("Class %1 %2 fuelCargo=%3 needs transportFuel",_sourceClass,configSourceModList _x,_fuelCargo);
    };
    _staticClasses pushBack _sourceClass;
    TRACE_3("static",_sourceClass,_transportFuel,_fuelCargo);
} forEach ("true" configClasses (configFile >> "CfgVehicles"));

uiNamespace setVariable [QGVAR(cacheRefuelClassesStatic), compileFinal (_staticClasses createHashMapFromArray [])];
uiNamespace setVariable [QGVAR(cacheRefuelClassesBaseDynamic), compileFinal (_baseDynamicClasses createHashMapFromArray [])];
uiNamespace setVariable [QGVAR(cacheRefuelCargo), compileFinal _cacheRefuelCargo];
