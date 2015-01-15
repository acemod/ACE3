/*

by commy2

Handles pressing the special vector keys.

*/
#include "script_component.hpp"

switch (_this select 0) do {
    case ("azimuth"): {
        if (diag_tickTime > GVAR(keyDownTimeDistance) + 0.5) then {
            GVAR(isKeyDownDistance) = false;    // emulate key release
            ["distance"] call FUNC(clearDisplay);
        };

        GVAR(isKeyDownAzimuth) = true;
        GVAR(keyDownTimeAzimuth) = diag_tickTime;

        [FUNC(onKeyHold), 0, "azimuth"] call CBA_fnc_addPerFrameHandler;
    };

    case ("distance"): {
        if (diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5) then {
            GVAR(isKeyDownAzimuth) = false;    // emulate key release
            ["azimuth"] call FUNC(clearDisplay);
        };

        GVAR(isKeyDownDistance) = true;
        GVAR(keyDownTimeDistance) = diag_tickTime;

        [FUNC(onKeyHold), 0, "distance"] call CBA_fnc_addPerFrameHandler;
    };
};
