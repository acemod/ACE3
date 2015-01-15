/*

by commy2

Handles pressing the special vector keys.

*/
#include "script_component.hpp"

private "_fnc_setPFH";
_fnc_setPFH = {
    if (GVAR(holdKeyHandler) > -1) then {
        [GVAR(holdKeyHandler)] call CBA_fnc_removePerFrameHandler;
        GVAR(holdKeyHandler) = -1;
    };

    GVAR(holdKeyHandler) = [FUNC(onKeyHold), 0, _this] call CBA_fnc_addPerFrameHandler;
};

switch (_this select 0) do {
    case ("azimuth"): {

        ["azimuth"] call FUNC(clearDisplay);

        GVAR(isKeyDownAzimuth) = true;

        if (diag_tickTime < GVAR(keyDownTimeAzimuth) + 0.5) exitWith {
            "azimuth+inclination" call _fnc_setPFH;
        };

        GVAR(keyDownTimeAzimuth) = diag_tickTime;

        if (diag_tickTime > GVAR(keyDownTimeDistance) + 0.5) then {
            ["distance"] call FUNC(clearDisplay);
            "azimuth" call _fnc_setPFH;
        } else {
            "azimuth+distance" call _fnc_setPFH;
        };

    };

    case ("distance"): {

        ["distance"] call FUNC(clearDisplay);

        GVAR(isKeyDownDistance) = true;

        if (diag_tickTime < GVAR(keyDownTimeDistance) + 0.5) exitWith {
            "height+distance" call _fnc_setPFH;
        };

        GVAR(keyDownTimeDistance) = diag_tickTime;

        if (diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5) then {
            ["azimuth"] call FUNC(clearDisplay);
            "distance" call _fnc_setPFH;
        } else {
            "azimuth+distance" call _fnc_setPFH;
        };

    };
};
