/*
 * Author: Gundy
 *
 * Description:
 *   Increases text and icon size
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_incTextSize;
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(textSize) = GVAR(textSize) + 1;
[] call FUNC(updateTextAndIconSize);

true