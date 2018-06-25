#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether the unit is able to detonate explosives
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Able to detonate <BOOL>
 *
 * Example:
 * if ([player] call ACE_Explosives_fnc_canDetonate) then { hint "Can Detonate"; };
 *
 * Public: Yes
 */

params ["_unit"];

([_unit] call FUNC(hasPlacedExplosives)) && {(count ([_unit] call FUNC(getDetonators))) > 0}
