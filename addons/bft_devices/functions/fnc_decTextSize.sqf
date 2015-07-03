/*
 * Author: Gundy
 *
 * Description:
 *   Decreases text and icon size
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_decTextSize;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(textSize) > 1) then {GVAR(textSize) = GVAR(textSize) - 1};
[] call FUNC(updateTextAndIconSize);

true