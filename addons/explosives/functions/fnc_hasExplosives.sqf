/*
 * Author: Garth 'L-H' de Wet
 * Whether the passed unit has any explosives on them.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * The unit has explosives <BOOL>
 *
 * Example:
 * _hasExplosives = [player] call ACE_Explosives_fnc_hasExplosives;
 *
 * Public: Yes
 */
#include "script_component.hpp"
// IGNORE_PRIVATE_WARNING(_hasExplosives);

private ["_unit", "_result", "_magazines"];
_result = false;
_unit = _this select 0;
_magazines = magazines _unit;
{
    if (getNumber (ConfigFile >> "CfgMagazines" >> _x >> "ACE_Placeable") == 1) exitWith {
        _result = true;
    };
} count _magazines;

_result
