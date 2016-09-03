/*
 * Author: Gundy
 *
 * Description:
 *   Sets up various text and icon sizes
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_updateTextAndiconSize;
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(iconSize) = GVAR(textAndIconScaleFactor) * 2;
GVAR(ownIconBaseSize) = 18 * GVAR(textAndIconScaleFactor) / 12;
GVAR(ownIconScaledSize) = GVAR(ownIconBaseSize) / (0.86 / (safezoneH * 0.8));
GVAR(IconManSize) = GVAR(iconSize) * 0.75;
GVAR(GroupOverlayiconSize) = GVAR(iconSize) * 1.625;
GVAR(UserMarkerArrowSize) = GVAR(textAndIconScaleFactor) * 8 * GVAR(mapScaleFactor);
GVAR(textSize) = GVAR(textAndIconScaleFactor) / 12 * 0.035;
GVAR(AirContactGrouptextAndIconScaleFactor) = GVAR(textAndIconScaleFactor) / 12 * 0.060;
GVAR(AirContactSize) = GVAR(textAndIconScaleFactor) / 12 * 32;
GVAR(AirContactDummySize) = GVAR(textAndIconScaleFactor) / 12 * 20;

true