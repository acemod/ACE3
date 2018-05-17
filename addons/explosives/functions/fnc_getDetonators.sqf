/*
 * Author: Garth 'L-H' de Wet, mharis001
 * Returns all detonators the given unit has.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Config names of detonators <ARRAY>
 *
 * Example:
 * [_player] call ace_explosives_fnc_getDetonators
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("Getting detonators",_unit);

(_unit call EFUNC(common,uniqueItems)) select {getNumber (configFile >> "CfgWeapons" >> _x >> QGVAR(Detonator)) == 1};
