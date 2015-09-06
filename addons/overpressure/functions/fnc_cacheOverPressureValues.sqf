/*
 * Author: joko // Jonas
 *
 * Handle fire of local launchers
 *
 * Argument:
 * 0: Weapon <STRING>
 * 1: Magazine <STRING>
 * 2: Ammo <STRING>
 *
 * Return value:
 * Array:
 *  0: Angle <Number>
 *  1: Range <Number>
 *  2: Damage <Number>
 *
 */
 #include "script_component.hpp"

params ["_weapon", "_ammo", "_magazine"];
TRACE_3("Parameter",_weapon,_magazine,_ammo);

private ["_array", "_type", "_return", "_config" /*, "_priority"*/];

// get Priority Array from Config
_array = [
    getNumber (configFile >> "CfgWeapons" >> QGVAR(priority)),
    getNumber (configFile >> "CfgMagazines" >> QGVAR(priority)),
    getNumber (configFile >> "CfgAmmo" >> QGVAR(priority))
];

TRACE_1("Proiroity Array",_array);

/* for CBA Upadte 2.1
_priority = _array call CBA_fnc_findMax;
_type = if (isNil "_priority") then {
    0
} else {
    _priority select 1
};
*/

// obsolete as CBA Update 2.1 start
_array params ["_max"];

// get Highest Entry out the the Priority Array
{
    if (_max < _x) then {
        _max = _x;
        _type = _forEachIndex;
    };
} forEach _array;
// obsolete end

TRACE_2("Highest Value",_max,_type);
// create the Config entry Point
_config = [
    (configFile >> "CfgWeapons" >> _weapon),
    (configFile >> "CfgMagazines" >> _magazine),
    (configFile >> "CfgAmmo" >> _ammo)
] select _type;
TRACE_1("ConfigPath",_config);

// get the Variables out of the Configes and create a array with then
_return = [
    (getNumber (_config >> QGVAR(angle))),
    (getNumber (_config >> QGVAR(range))),
    (getNumber (_config >> QGVAR(damage)))
];
TRACE_1("Return",_return);
_varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
missionNameSpace setVariable [format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine], _return];

_return
