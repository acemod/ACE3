#include "script_component.hpp"

[QGVAR(setVehicleDamage), {_this call FUNC(setDamage)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleHitPointDamage), {_this call FUNC(setHitPointDamage)}] call CBA_fnc_addEventHandler;

// wheels
[QGVAR(setWheelHitPointDamage), {
    params ["_object", "_hitPoint", "_damage"];
    private _isDamageAllowed = isDamageAllowed _object;

    if !(_isDamageAllowed) then {
        _object allowDamage true;
    };

    _object setHitPointDamage [_hitPoint, _damage];

    if !(_isDamageAllowed) then {
        _object allowDamage false;
    };
}] call CBA_fnc_addEventHandler;
