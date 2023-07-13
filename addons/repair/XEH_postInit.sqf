#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};

[QGVAR(setVehicleDamage), {_this call FUNC(setDamage)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleHitPointDamage), {_this call FUNC(setHitPointDamage)}] call CBA_fnc_addEventHandler;

[QGVAR(setWheelHitPointDamage), {
    params ["_object", "_hitPoint", "_damage"];
    private _damageDisabled = !isDamageAllowed _object;

    if (_damageDisabled) then {
        _object allowDamage true;
    };

    _object setHitPointDamage [_hitPoint, _damage];

    if (_damageDisabled) then {
        _object allowDamage false;
    };
}] call CBA_fnc_addEventHandler;


["All", "InitPost", {
    params ["_vehicle"];
    if !(local _vehicle && {(getRepairCargo _vehicle) isNotEqualTo -1}) exitWith {};

    _vehicle setRepairCargo 0;
}, true, [], true] call CBA_fnc_addClassEventHandler;
