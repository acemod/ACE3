/*
 * Author: commy2
 * Draw the visible laser beams of all cached units.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private _isIR = currentVisionMode ACE_player;

// no lasers in thermal mode
if !(_isIR isEqualTo 2) then {
    // is using IR mode
    _isIR = _isIR isEqualTo 1;

    private _brightness = 2 - call EFUNC(common,ambientBrightness);

    {
        // red laser. draw green dot anyway in IR mode
        [_x, 100, _isIR, _brightness] call FUNC(drawLaserpoint);
    } count GVAR(redLaserUnits);

    {
        // green laser
        [_x, 100, true, _brightness] call FUNC(drawLaserpoint);
    } count GVAR(greenLaserUnits);
};
