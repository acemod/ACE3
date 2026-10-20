#include "..\script_component.hpp"
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
 *  0: Angle <NUMBER>
 *  1: Range <NUMBER>
 *  2: Damage <NUMBER>
 *  3: Offset <NUMBER>
 *
 * Example:
 * ["cannon_125mm","Sh_125mm_APFSDS_T_Green","24Rnd_125mm_APFSDS_T_Green"] call ace_overpressure_fnc_getOverPressureValues
 *
 * Public: No
 */

params ["_weapon", "_ammo", "_magazine"];
TRACE_3("Parameter",_weapon,_magazine,_ammo);

// Check cache for weapon/ammo/mag combo
private _return = GVAR(cacheHash) get _this;
if (!isNil "_return") exitWith {
    TRACE_3("CacheHit",_weapon,_magazine,_ammo);
    _return
};

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

// get the Variables out of the Configs and populate return array with them
_return = [
    (getNumber (_config >> QGVAR(angle))),
    (getNumber (_config >> QGVAR(range))),
    (getNumber (_config >> QGVAR(damage))),
    (getNumber (_config >> QGVAR(offset)))
];

GVAR(cacheHash) set [_this, _return];
TRACE_2("Return",_this,_return);

_return
