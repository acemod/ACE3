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
 * hasExplosives = [player] call ACE_Explosives_fnc_hasExplosives;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

private _result = false;
private _magazines = magazines _unit;
{
    if (getNumber (ConfigFile >> "CfgMagazines" >> _x >> QGVAR(Placeable)) == 1) exitWith {
        _result = true;
    };
} count _magazines;

_result
