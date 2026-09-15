#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (!hasInterface) exitWith {};

private _replaceTerrainClasses = QUOTE(
    getNumber (_x >> QQGVAR(replaceTerrainObject)) > 0
    && {getNumber (_x >> 'scope') == 2}
) configClasses (configFile >> "CfgVehicles");

private _cacheReplaceTerrainModels = createHashMap;
{
    private _model = toLowerANSI getText (_x >> "model");
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


// Cache classes with anim actions
private _animActionsClasses = (QUOTE(isClass (_x >> QQGVAR(anims)) && {!isClass (inheritsFrom _x >> QQGVAR(anims))}) configClasses (configFile >> "CfgVehicles"));
_animActionsClasses = _animActionsClasses apply { configName _x };
_animActionsClasses = _animActionsClasses select {
    private _class = _x;
    (_animActionsClasses findIf {(_class != _x) && {_class isKindOf _x}}) == -1  // filter classes that already have a parent in the list
};
uiNamespace setVariable [QGVAR(animActionsClasses), compileFinal (_animActionsClasses createHashMapFromArray [])];
