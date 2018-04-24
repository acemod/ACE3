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
 * Example:
 * call ACE_laserpointer_fnc_onDraw
 *
 * Public: No
 */
#include "script_component.hpp"

if (count GVAR(redLaserUnits) + count GVAR(greenLaserUnits) > 0 && {!GVAR(isTI)}) then {
    private _brightness = 2 - call EFUNC(common,ambientBrightness);

    {
        // red laser. draw green dot anyway in IR mode
        [_x, 100, GVAR(isIR), _brightness] call FUNC(drawLaserpoint);
    } count GVAR(redLaserUnits);

    {
        // green laser
        [_x, 100, true, _brightness] call FUNC(drawLaserpoint);
    } count GVAR(greenLaserUnits);
};
