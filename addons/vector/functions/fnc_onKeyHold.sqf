/*

by commy2

PFH executed while holding a vector key down.

*/
#include "script_component.hpp"

switch (_this select 0) do {
    case ("azimuth"): {

        [false] call FUNC(showCenter);

        call FUNC(showAzimuth);

        if (!GVAR(isKeyDownAzimuth)) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("distance"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownDistance)) then {
            if (_isReady) then {
                call FUNC(showDistance);
                [false] call FUNC(showCenter);
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("azimuth+distance"): {

        call FUNC(showAzimuth);

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            call FUNC(showDistance);
            [false] call FUNC(showCenter);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("azimuth+inclination"): {

        [false] call FUNC(showCenter);

        call FUNC(showAzimuthInclination);

        if (!GVAR(isKeyDownAzimuth)) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("height+distance"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownDistance)) then {
            if (_isReady) then {
                call FUNC(showHeightDistance);
                [false] call FUNC(showCenter);
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

};

systemChat str (_this select 0);//
