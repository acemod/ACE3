/*
 * Author: commy2
 * Select weapon for unit in vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Weapon index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player, 1] call ace_weaponselect_fnc_selectWeaponVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_index"];

private "_turret";
_turret = [_unit] call EFUNC(common,getTurretIndex);

if (_turret isEqualTo [] && {_unit == driver _vehicle}) then {
    private ["_weapons", "_weapon"];

    _weapons = weapons _vehicle;
    if (_index > count _weapons - 1) exitWith {};

    _weapon = _weapons select _index;

    _index = 0;
    while {
        _index < 100 && {currentWeapon _vehicle != _weapon}
    } do {
        _unit action ["SwitchWeapon", _vehicle, _unit, _index];
        _index = _index + 1;
    };

} else {
    private ["_weapons", "_weapon"];

    _weapons = _vehicle weaponsTurret _turret;
    if (_index > count _weapons - 1) exitWith {};

    _weapon = _weapons select _index;

    _index = 0;
    while {
        _index < 100 && {_vehicle currentWeaponTurret _turret != _weapon}
    } do {
        _unit action ["SwitchWeapon", _vehicle, _unit, _index];
        _index = _index + 1;
    };

};
