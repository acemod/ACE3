/*
 * Author: Garth 'L-H' de Wet
 * Returns all the detonators of the unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Configs of all detonators <ARRAY>
 *
 * Example:
 * _detonators = [player] call ACE_Explosives_fnc_getDetonators;
 *
 * Public: Yes
 */
#include "script_component.hpp"
// IGNORE_PRIVATE_WARNING(_detonators);

params ["_unit"];
TRACE_1("params",_unit);

private _result = (items _unit) select {getNumber (ConfigFile >> "CfgWeapons" >> _x >> QGVAR(Detonator)) == 1};
_result = _result arrayIntersect _result;

_result
