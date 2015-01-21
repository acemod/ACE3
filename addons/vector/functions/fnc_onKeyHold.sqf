/*

by commy2

PFH executed while holding a vector key down.

*/
#include "script_component.hpp"

switch (_this select 0) do {
    case ("azimuth"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.2;

        [false] call FUNC(showCenter);

        if (_isReady) then {
            call FUNC(showAzimuth);
        };

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

    case ("azimuth+inclination"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.2;

        [false] call FUNC(showCenter);

        if (_isReady) then {
            call FUNC(showAzimuthInclination);
        };

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

    case ("relative_distance"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                call FUNC(showRelativeDistance);
            };
            [false] call FUNC(showCenter);
            [false] call FUNC(showP1);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("relative_height+length"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                call FUNC(showRelativeHeightLength);
            };
            [false] call FUNC(showCenter);
            [false] call FUNC(showP1);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("relative_azimuth+distance"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                call FUNC(showRelativeAzimuthDistance);
            };
            [false] call FUNC(showCenter);
            [false] call FUNC(showP1);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("fall_of_short"): {

        private "_isReady";
        _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                GVAR(FOSData) = call FUNC(getFallOfShort);//
                [false] call FUNC(showFallOfShort);
            };
            [false] call FUNC(showCenter);
            [false] call FUNC(showP1);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

};

//systemChat str (_this select 0);
