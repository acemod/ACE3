#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Checks if vehicle can be flipped.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can Flip <BOOL>
 *
 * Example:
 * cursorObject call ace_interaction_fnc_canFlip
 *
 * Public: No
 */

params ["_vehicle"];

// Most suitable mass for all vanilla, CUP and RHS statics ATM (ZU-23 suits, D-30 and M119 don't suit)
#define FLIP_MAX_STATICWEAPON_MASS 2000

1 < (vectorUp _vehicle) vectorDistance (surfaceNormal getPosATL _vehicle)
&& {crew _vehicle findIf {alive _x && {!unitIsUAV _x}} == -1}
&& {getMass _vehicle <= FLIP_MAX_STATICWEAPON_MASS}
