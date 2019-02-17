#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _cacheStaticModels = [];

private _vehicleClasses = "isClass _x && (configName _x) isKindOf 'Static'" configClasses (configFile >> "CfgVehicles");

// Consider static everything vehicle that inherit from Static
// This include houses (which we don't need), but also walls, that we do
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLower (_array select ((count _array) - 1));
    };
} forEach _vehicleClasses;

private _nonAIVehicleClasses = "isClass _x" configClasses (configFile >> "CfgNonAIVehicles");

// Also consider static all object inheriting from bridges
private _cfgBase = configFile >> "CfgNonAIVehicles";
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLower (_array select ((count _array) - 1));
    };
} forEach (_nonaivehicleClasses select {(configName _x) isKindOf ["Bridge_base_F", _cfgBase]});

uiNamespace setVariable [QGVAR(cacheStaticModels), compileFinal str _cacheStaticModels];
TRACE_1("compiled",count _cacheStaticModels);
