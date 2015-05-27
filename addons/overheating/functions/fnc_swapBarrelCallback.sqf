/*
 * Author: Commy2
 * Swap barrel callback
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_player,_weapon);

// don't consume the barrel, but rotate through them.
[localize STRING(SwappedBarrel), QUOTE(PATHTOF(UI\spare_barrel_ca.paa))] call EFUNC(common,displayTextPicture);

_player setVariable [format [QGVAR(%1), _weapon], [0, 0], false];
