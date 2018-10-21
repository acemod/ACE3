#include "script_component.hpp"
/*
 * Author: Glowbal
 * Force a unit to go prone
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_setProne
 *
 * Public: Yes
 */

params ["_unit"];

[
    _unit,
    ["amovppnemstpsnonwnondnon", "amovppnemstpsraswrfldnon", "amovppnemstpsraswlnrdnon", "amovppnemstpsraswpstdnon"] select (([primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] find currentWeapon _unit) + 1)
] call FUNC(doAnimation);
