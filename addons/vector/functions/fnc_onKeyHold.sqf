/*

by commy2

PFH executed while holding a vector key down.

*/
#include "script_component.hpp"

switch (_this select 0) do {
    case ("azimuth"): {

        if (diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5) then {
            call FUNC(showAzimuth);
        };

        if (!GVAR(isKeyDownAzimuth)) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

    };

    case ("distance"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownDistance)) then {
            if (_isReady) then {
                call FUNC(showDistance);
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

    };
};
