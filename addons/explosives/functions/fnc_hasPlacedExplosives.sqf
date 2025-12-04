#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether the passed unit has placed any explosives or has a clacker that was used when explosives were placed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Has Placed Explosives <BOOL>
 *
 * Example:
 * _hasPlacedExplosives = [player] call ACE_Explosives_fnc_hasPlacedExplosives;
 *
 * Public: Yes
 */

(count (call FUNC(getPlacedExplosives)) > 0)
