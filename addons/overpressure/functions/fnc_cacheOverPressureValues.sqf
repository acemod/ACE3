#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Cache the shot data for a given weapon/mag/ammo combination.
 * Will use the config that has the highest priority.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Magazine <STRING>
 * 2: Ammo <STRING>
 *
 * Return Value:
 * Shot Config <ARRAY>:
 *  0: Angle <Number>
 *  1: Range <Number>
 *  2: Damage <Number>
 *
 * Example: 
 * ["cannon_125mm","Sh_125mm_APFSDS_T_Green","24Rnd_125mm_APFSDS_T_Green"] call ace_overpressure_fnc_cacheOverPressureValues
 *
 * Public: No
 */

params ["_weapon", "_ammo", "_magazine"];
TRACE_3("Parameter",_weapon,_magazine,_ammo);

// get Priority Array from Config
private _array = [
    getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(priority)),
    getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(priority)),
    getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(priority))
];

(_array call CBA_fnc_findMax) params ["", ["_indexOfMaxPriority", 0, [0]]];

TRACE_2("Priority Array",_array,_indexOfMaxPriority);

// create the Config entry Point
private _config = [
    (configFile >> "CfgWeapons" >> _weapon),
    (configFile >> "CfgMagazines" >> _magazine),
    (configFile >> "CfgAmmo" >> _ammo)
] select _indexOfMaxPriority;
TRACE_1("ConfigPath",_config);

// get the Variables out of the Configes and create a array with then
private _return = [
    (getNumber (_config >> QGVAR(angle))),
    (getNumber (_config >> QGVAR(range))) * GVAR(distanceCoefficient),
    (getNumber (_config >> QGVAR(damage)))
];

private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
missionNameSpace setVariable [_varName, _return];
TRACE_2("Return",_varName,_return);

_return
