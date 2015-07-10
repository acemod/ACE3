/*
 * Author: joko // Jonas
 *
 * Handle fire of local launchers
 *
 * Argument:
 * 0: Magazine (String)
 * 1:
 *
 * Return value:
 * Array:
 *  0:
 *  1:
 *  2:
 *
 */
 #include "script_component.hpp"

EXPLODE_2_PVT(_this,_weapon,_magazine);
if !(isNil (QGVAR(Damage) + _magazine)) exitWith {};
private ["_damage","_angle","_range"];
_damage = getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(damage));
if (_damage == 0) then {
    _angle = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(angle)) / 2;
    _range = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(range));
    _damage = getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(damage));
} else {
    _angle = getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(angle)) / 2;
    _range = getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(range));
};

missionNameSpace setVariable [(QGVAR(Angle) + _magazine),_angle];
missionNameSpace setVariable [(QGVAR(Range) + _magazine),_range];
missionNameSpace setVariable [(QGVAR(Damage) + _magazine),_damage];

[_angle,_range,_damage]
