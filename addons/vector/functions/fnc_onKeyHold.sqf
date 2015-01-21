/*

by commy2

PFH executed while holding a vector key down.

*/
#include "script_component.hpp"

if (currentWeapon ACE_player != "ACE_Vector") exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    GVAR(currentMode) = "";

    if (GVAR(holdKeyHandler) > -1) then {
        GVAR(holdKeyHandler) = -1;
    };
};

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

    case ("settings"): {
        if (diag_tickTime < GVAR(keyDownTimeMenu) + 0.5) exitWith {
            GVAR(keyDownTimeAzimuth) = diag_tickTime;
        };

        /*[["meter", "feet"] select GVAR(useFeet)] call FUNC(showText);
        [["deg",   "mil" ] select GVAR(useMil)]  call FUNC(showText);*/

        if (GVAR(keyDownTabCountAzimuth) > 0 && {diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5}) exitWith {
            systemChat "abort";

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };
        //show current mode
    };

    case ("config"): {
        if (diag_tickTime < GVAR(keyDownTimeMenu) + 0.5) exitWith {
            GVAR(keyDownTimeDistance) = diag_tickTime;
        };

        [["meter", "feet"] select (GVAR(configTemp) select 0)] call FUNC(showText);
        [["deg",   "mil" ] select (GVAR(configTemp) select 0)]  call FUNC(showText);

        if (GVAR(keyDownTabCountDistance) > 0 && {diag_tickTime > GVAR(keyDownTimeDistance) + 0.5}) exitWith {
            if (GVAR(keyDownTabCountDistance) >= 5) exitWith {
                GVAR(useFeet) = GVAR(configTemp) select 0;
                GVAR(useMil) = GVAR(configTemp) select 1;

                systemChat "set";
            };

            systemChat "abort";

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };
        //show current mode
    };

};

//systemChat str (_this select 0);
