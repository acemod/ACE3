#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether the unit is able to detonate explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 *
 * Return Value:
 * Able to detonate <BOOL>
 *
 * Example:
 * player call ace_explosives_fnc_canDetonate
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

alive _unit && {_unit call FUNC(hasPlacedExplosives)} && {(GVAR(detonators) findAny (_unit call EFUNC(common,uniqueItems))) != -1} // return
