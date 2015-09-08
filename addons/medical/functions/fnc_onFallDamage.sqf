// by commy2
#include "script_component.hpp"

params ["_unit", "_newDamage"];

private ["_totalDamageL", "_totalDamageR", "_minLethalDamage"];

_totalDamageL = (_unit getHitPointDamage "HitLeftLeg") + _newDamage;
_totalDamageR = (_unit getHitPointDamage "HitRightLeg") + _newDamage;

[_unit] call FUNC(addToInjuredCollection);

_unit setHitPointDamage ["HitLeftLeg", _totalDamageL];
_unit setHitPointDamage ["HitRightLeg", _totalDamageR];

//systemChat format ["falling: %1", _this];

if (GVAR(level) < 2 || {!([_unit] call FUNC(hasMedicalEnabled))}) then {
    [_unit, "leg_r", _newDamage] call FUNC(handleDamage_basic);
} else {
    /*_cache_params = _unit getVariable [QGVAR(cachedHandleDamageParams), []];
    _cache_damages = _unit getVariable QGVAR(cachedDamages);
    {
        _params = _x + [_cache_damages select _foreachIndex];
        _params call FUNC(handleDamage_advanced);
    } foreach _cache_params;
    [_unit] call FUNC(handleDamage_advancedSetDamage);*/
};
