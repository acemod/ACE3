// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_totalDamage"];

_totalDamage = (_unit getHitPointDamage "HitHead") + _newDamage;

[_unit] call FUNC(addToInjuredCollection);

_unit setHitPointDamage ["HitHead", _totalDamage];

//systemChat format ["drowning: %1", _this];

if (GVAR(level) < 2 || {!([_unit] call FUNC(hasMedicalEnabled))}) then {
    [_unit, "head", _newDamage] call FUNC(handleDamage_basic);
} else {
    /*_cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
    _cache_damages = _unit getVariable QGVAR(cachedDamages);
    {
        _params = _x + [_cache_damages select _foreachIndex];
        _params call FUNC(handleDamage_advanced);
    } foreach _cache_params;
    [_unit] call FUNC(handleDamage_advancedSetDamage);*/
};
