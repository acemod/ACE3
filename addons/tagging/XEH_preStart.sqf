#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _cacheStaticModels = [];

private _vehicleClasses = "(configName _x) isKindOf 'Static'" configClasses (configFile >> "CfgVehicles");

// Consider static everything vehicle that inherit from Static
// This include houses (which we don't need), but also walls, that we do
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLowerANSI (_array select -1);
    };
} forEach _vehicleClasses;

private _nonAIVehicleClasses = "true" configClasses (configFile >> "CfgNonAIVehicles");

// Also consider static all object inheriting from bridges
private _cfgBase = configFile >> "CfgNonAIVehicles";
{
    private _model = getText (_x >> "model");
    if (_model != "") then {
        private _array = _model splitString "\";
        _cacheStaticModels pushBackUnique toLowerANSI (_array select -1);
    };
} forEach (_nonAIVehicleClasses select {(configName _x) isKindOf ["Bridge_base_F", _cfgBase]});

uiNamespace setVariable [QGVAR(cacheStaticModels), compileFinal (_cacheStaticModels createHashMapFromArray [])];
TRACE_1("compiled",count _cacheStaticModels);

// force preload of stencil texture to avoid error popup
//  Warning Message: Cannot load mipmap z\ace\addons\fonts\sairastencilone\ace_stencil64-01.paa
"Test" getTextWidth ["ACE_Stencil", 0.3];
