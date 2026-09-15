#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether the passed unit has placed any explosives or has a clacker that was used when explosives were placed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * If unit has explosives <BOOL>
 *
 * Example:
 * player call ace_explosives_fnc_hasPlacedExplosives
 *
 * Public: Yes
 */

// Do params type check only in FUNC(getPlacedExplosives)
params ["_unit"];
TRACE_1("params",_unit);

(_unit call FUNC(getPlacedExplosives)) isNotEqualTo [] // return
