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
 *
 * Note: Not functional, because FUNC(localAnim) does no longer exist
 */
#include "script_component.hpp"

params ["_unit"];

[
    _unit,
    ["amovppnemstpsnonwnondnon", "amovppnemstpsraswrfldnon", "amovppnemstpsraswlnrdnon", "amovppnemstpsraswpstdnon"] select (([primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] find currentWeapon _unit) + 1)
] call FUNC(localAnim);
