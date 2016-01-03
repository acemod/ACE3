/*
 * Author: Garth 'L-H' de Wet
 * Clears all dirt, rain, dust from glasses.
 * Removes glasses effect (PP, overlay) and then puts it back.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_clearGlasses
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_unit", "_broken", "_effects"];

_unit = ACE_player;

_broken = GETBROKEN;
_effects = GLASSESDEFAULT;
_effects set [BROKEN, _broken];

SETGLASSES(_unit,_effects);

if (stance _unit != "PRONE") then {
    _unit playActionNow "gestureWipeFace";
};

[{
    if (cameraView == "INTERNAL") then {
        addCamShake [5, 1.75, 2];
    };
}, [], 0.3] call EFUNC(common,waitAndExecute);

call FUNC(removeDirtEffect);
call FUNC(removeRainEffect);
call FUNC(removeDustEffect);
