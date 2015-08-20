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
 * [player] call ace_goggles_fnc_ClearGlasses;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_unit",ACE_Player,[objNull]]];
private ["_broken", "_effects"];

_broken = GETBROKEN(_unit);
_effects = GLASSESDEFAULT;
_effects set [BROKEN, _broken];
SETGLASSES(_unit,_effects);

if ((stance _unit) != "PRONE") then {
    _unit playActionNow "gestureWipeFace";
};

[{
    if (cameraView == "INTERNAL") then {
        addCamShake [5, 1.75, 2];
    };
}, [], 0.3, 0] call EFUNC(common,waitAndExecute);

[_unit] call FUNC(removeDirtEffect);
[_unit] call FUNC(removeRainEffect);
[_unit] call FUNC(removeDustEffect);
