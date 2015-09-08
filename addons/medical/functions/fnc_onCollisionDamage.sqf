// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_selection", "_totalDamage"];

_selection = "body";

if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {GVAR(enableVehicleCrashes)}) then {
    _selection = GVAR(SELECTIONS) select floor random count GVAR(SELECTIONS);
};

_totalDamage = (_unit getHit _selection) + _newDamage;

[_unit] call FUNC(addToInjuredCollection);

_unit setHit [_selection, _totalDamage];

//systemChat format ["collision: %1", _this];

if (GVAR(level) < 2 || {!([_unit] call FUNC(hasMedicalEnabled))}) then {
    [_unit, _selection, _newDamage] call FUNC(handleDamage_basic);
} else {
    /*_cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
    _cache_damages = _unit getVariable QGVAR(cachedDamages);
    {
        _params = _x + [_cache_damages select _foreachIndex];
        _params call FUNC(handleDamage_advanced);
    } foreach _cache_params;
    [_unit] call FUNC(handleDamage_advancedSetDamage);*/
};
