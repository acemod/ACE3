#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, mharis001
 * Checks if given unit has any placeable explosives on them.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has explosives <BOOL>
 *
 * Example:
 * [player] call ace_explosives_fnc_hasExplosives
 *
 * Public: Yes
 */

params ["_unit"];
TRACE_1("params",_unit);

private _cfgMagazines = configFile >> "CfgMagazines";
private _magazines = magazines _unit;

((_magazines arrayIntersect _magazines) findIf {getNumber (_cfgMagazines >> _x >> QGVAR(Placeable)) == 1}) > -1
