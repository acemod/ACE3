#include "script_component.hpp"

#include "XEH_PREP.hpp"


//See XEH_postInit.sqf
private _vehicleClasses_addClassEH = ["ThingX", "LandVehicle", "Air", "Ship_F"];
private _objectClasses_addClassEH = ["ThingX", "StaticWeapon"];
private _vehicleClasses_addAction = [];
private _itemClasses_addAction = [];

// find all remaining configured classes and init them
{
    private _class = configName _x;
    // init vehicle
    if (
        1 == getNumber (_x >> QGVAR(hasCargo))
        && {-1 == _vehicleClasses_addClassEH findIf {_class isKindOf _x}}
    ) then {
        if (_class isKindOf "Static") then {
            if (2 == getNumber (_x >> "scope")) then {
                _vehicleClasses_addAction pushBackUnique _class;
            };
        } else {
            _vehicleClasses_addClassEH pushBackUnique _class;
        };
    };
    // init object
    if (
        1 == getNumber (_x >> QGVAR(canLoad))
        && {-1 == _objectClasses_addClassEH findIf {_class isKindOf _x}}
    ) then {
        if (_class isKindOf "Static") then {
            if (2 == getNumber (_x >> "scope")) then {
                _itemClasses_addAction pushBackUnique _class;
            };
        } else {
            _objectClasses_addClassEH pushBackUnique _class;
        };
    };
} forEach ("true" configClasses (configFile >> "CfgVehicles"));


uiNamespace setVariable [QGVAR(vehicleClasses_classEH), compileFinal str _vehicleClasses_addClassEH];
uiNamespace setVariable [QGVAR(objectClasses_classEH), compileFinal str _objectClasses_addClassEH];
uiNamespace setVariable [QGVAR(initializedVehicleClasses), compileFinal str _vehicleClasses_addAction];
uiNamespace setVariable [QGVAR(initializedItemClasses), compileFinal str _itemClasses_addAction];

TRACE_4("compiled",count _vehicleClasses_addClassEH,count _objectClasses_addClassEH,count _vehicleClasses_addAction,count _itemClasses_addAction);
