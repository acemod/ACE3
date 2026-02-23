#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, mharis001
 * Returns all detonators the given unit has.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 *
 * Return Value:
 * Config names of detonators <ARRAY>
 *
 * Example:
 * player call ace_explosives_fnc_getDetonators
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("getting detonators",_unit);

GVAR(detonators) arrayIntersect ((_unit call EFUNC(common,uniqueItems)) + weapons _unit) // return
