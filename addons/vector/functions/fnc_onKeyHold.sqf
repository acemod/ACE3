#include "script_component.hpp"
/*
 * Author: commy2
 * PFH executed while holding a vector key down.
 *
 * Arguments:
 * 0: String <STRING>
 * 1: Number <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["5", 5] call ace_vector_fnc_onKeyHold
 *
 * Public: No
 */

if (!((currentWeapon ACE_player) isKindOf ["ACE_Vector", configFile >> "CfgWeapons"])) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    GVAR(currentMode) = "";

    if (GVAR(holdKeyHandler) > -1) then {
        GVAR(holdKeyHandler) = -1;
    };
};

switch (_this select 0) do {
    case ("azimuth"): {

        private _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.2;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                call FUNC(showDistance);
                [false] call FUNC(showCenter);
                [] call FUNC(dataTransfer);
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

    };

    case ("azimuth+inclination"): {

        private _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.2;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5;

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

        private _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

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

    case ("fall_of_shot"): {

        private _isReady = diag_tickTime > GVAR(keyDownTimeDistance) + 0.5;

        [_isReady] call FUNC(showCenter);

        if (!GVAR(isKeyDownAzimuth) && {!GVAR(isKeyDownDistance)}) then {
            if (_isReady) then {
                GVAR(FOSData) = call FUNC(getFallOfShot);
                [false] call FUNC(showFallOfShot);
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
        if (diag_tickTime < GVAR(keyDownTimeMenu) + 1) exitWith {
            GVAR(keyDownTimeAzimuth) = diag_tickTime;
        };

        [["meter", "feet"] select (GVAR(configTemp) select 0)] call FUNC(showText);
        [["deg",   "mil" ] select (GVAR(configTemp) select 1)] call FUNC(showText);

        if (GVAR(keyDownTabCountAzimuth) >= 5) exitWith {
            GVAR(useFeet) = GVAR(configTemp) select 0;
            GVAR(useMil) = GVAR(configTemp) select 1;

            ["clear_left"] call FUNC(showText);
            ["clear_right"] call FUNC(showText);
            ["stor"] call FUNC(showText);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

        if (GVAR(keyDownTabCountAzimuth) > 0 && {diag_tickTime > GVAR(keyDownTimeAzimuth) + 0.5}) exitWith {

            ["clear_left"] call FUNC(showText);
            ["clear_right"] call FUNC(showText);
            ["old_settings"] call FUNC(showText);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };
    };

    case ("config"): {
        if (diag_tickTime < GVAR(keyDownTimeMenu) + 1) exitWith {
            GVAR(keyDownTimeDistance) = diag_tickTime;
        };

        switch (GVAR(configTemp)) do {
            case (0): {
                ["eret"] call FUNC(showText);
                ["off"]  call FUNC(showText);
            };
            case (1): {
                ["eret"] call FUNC(showText);
                ["on"]   call FUNC(showText);
            };
            case (2): {
                ["nigt"] call FUNC(showText);
                ["on"]   call FUNC(showText);
            };
        };

        if (GVAR(keyDownTabCountDistance) >= 5) exitWith {
            GVAR(modeReticle) = GVAR(configTemp);

            ["clear_left"] call FUNC(showText);
            ["clear_right"] call FUNC(showText);
            ["stor"] call FUNC(showText);

            // set new config settings
            switch (GVAR(configTemp)) do {
                case (0): {
                    [false] call FUNC(adjustBrightness);
                    [false] call FUNC(showReticle);
                };
                case (1): {
                    [false] call FUNC(adjustBrightness);
                    [true] call FUNC(showReticle);
                };
                case (2): {
                    [true] call FUNC(adjustBrightness);
                    [true] call FUNC(showReticle);
                };
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };

        if (GVAR(keyDownTabCountDistance) > 0 && {diag_tickTime > GVAR(keyDownTimeDistance) + 0.5}) exitWith {

            ["clear_left"] call FUNC(showText);
            ["clear_right"] call FUNC(showText);
            ["old_config"] call FUNC(showText);

            [_this select 1] call CBA_fnc_removePerFrameHandler;

            GVAR(currentMode) = "";

            if (GVAR(holdKeyHandler) > -1) then {
                GVAR(holdKeyHandler) = -1;
            };
        };
    };

};
