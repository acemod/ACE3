#include "script_component.hpp"
/*
 * Author: Kingsley
 * Lowers the game and music volume with values from ACE settings.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_volume_fnc_lowerVolume
 *
 * Public: No
 */

EGVAR(hearing,disableVolumeUpdate) = true;

private _coef = XGVAR(reduction) / 10;
private _reductionGame = _coef * GVAR(initialGameVolume);
private _reductionMusic = _coef * GVAR(initialMusicVolume);

XGVAR(fadeDelay) fadeSound (GVAR(initialGameVolume) - _reductionGame);
XGVAR(fadeDelay) fadeMusic (GVAR(initialMusicVolume) - _reductionMusic);

GVAR(isLowered) = true;

if (XGVAR(showNotification)) then {
    [LLSTRING(Lowered)] call EFUNC(common,displayTextStructured);
};
