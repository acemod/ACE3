#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (!hasInterface) exitWith {};

private _replaceTerrainClasses = QUOTE(
    getNumber (_x >> QQGVAR(replaceTerrainObject)) > 0
    && {getNumber (_x >> 'scope') == 2}
) configClasses (configFile >> "CfgVehicles");

private _cacheReplaceTerrainModels = createHashMap;
{
    private _model = toLower getText (_x >> "model");
    if (_model select [0, 1] == "\") then {
        _model = _model select [1];
    };
    if ((_model select [count _model - 4]) != ".p3d") then {
        _model = _model + ".p3d"
    };
    if (_model in _cacheReplaceTerrainModels) then {continue};
    _cacheReplaceTerrainModels set [_model, configName _x];
} forEach _replaceTerrainClasses;

uiNamespace setVariable [QGVAR(cacheReplaceTerrainModels), compileFinal str _cacheReplaceTerrainModels];
