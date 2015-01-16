/*
 * Author: Commy2
 *
 * Swap barrel callback
 *
 * Argument:
 * 0: unit
 * 1: weapon
 *
 * Return value:
 * None
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_player,_weapon);

// don't consume the barrel, but rotate through them.
[localize "STR_ACE_Overheating_SwappedBarrel", QUOTE(PATHTOF(UI\spare_barrel_ca.paa))] call EFUNC(common,displayTextPicture);

_player setVariable [format [QGVAR(%1), _weapon], [0, 0], false];
