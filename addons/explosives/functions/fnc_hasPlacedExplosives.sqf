#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether the passed unit has placed any explosives or has a clacker that was used when explosives were placed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Configs of all detonators <ARRAY>
 *
 * Example:
 * _hasPlacedExplosives = [player] call ACE_Explosives_fnc_hasPlacedExplosives;
 *
 * Public: Yes
 */
// IGNORE_PRIVATE_WARNING(_hasPlacedExplosives);

(count (_this call FUNC(getPlacedExplosives)) > 0)
