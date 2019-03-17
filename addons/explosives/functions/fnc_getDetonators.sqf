#include "script_component.hpp"
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

params ["_unit"];
TRACE_1("Getting detonators",_unit);

private _cfgWeapons = configFile >> "CfgWeapons";
(_unit call EFUNC(common,uniqueItems)) select {getNumber (_cfgWeapons >> _x >> QGVAR(Detonator)) == 1};
