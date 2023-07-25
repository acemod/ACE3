#include "script_component.hpp"
/*
 * Author: Kingsley
 * Restores the game and music volume to what it was when the mission first started,
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_volume_fnc_restoreVolume
 *
 * Public: No
 */

EGVAR(hearing,disableVolumeUpdate) = false;

XGVAR(fadeDelay) fadeSound GVAR(initialGameVolume);
XGVAR(fadeDelay) fadeMusic GVAR(initialMusicVolume);

GVAR(isLowered) = false;

if (XGVAR(showNotification)) then {
    [LLSTRING(Restored)] call EFUNC(common,displayTextStructured);
};
