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
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

[
    _unit,
    ["amovppnemstpsnonwnondnon", "amovppnemstpsraswrfldnon", "amovppnemstpsraswlnrdnon", "amovppnemstpsraswpstdnon"] select (([primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] find currentWeapon _unit) + 1)
] call FUNC(localAnim);
