#include "script_component.hpp"

#include "XEH_PREP.hpp"


private _cacheStaticModels = [];

private _vehicleClasses = "isClass _x && (configName _cfgClass) isKindOf 'Static'" configClasses (configFile >> "CfgVehicles");

{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique [(_array select ((count _array) - 1)), true];
    };
} forEach _vehicleClasses;


private _nonAIVehicleClasses = "isClass _x" configClasses (configFile >> "CfgNonAIVehicles");

// Also consider static all object inheriting from bridges
_cfgBase = configFile >> "CfgNonAIVehicles";
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique [(_array select ((count _array) - 1)), true];
    };
} forEach (_nonaivehicleClasses select {(configName _x) isKindOf ["Bridge_base_F", _cfgBase]});

uiNamespace setVariable [QGVAR(cacheStaticModels), _cacheStaticModels];
