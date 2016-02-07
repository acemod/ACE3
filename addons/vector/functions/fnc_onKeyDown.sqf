/*

by commy2

Handles pressing the special vector keys.

*/
#include "script_component.hpp"

// set vector config settings
switch (GVAR(modeReticle)) do {
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

private "_fnc_setPFH";
_fnc_setPFH = {
    if (GVAR(holdKeyHandler) > -1) then {
        [GVAR(holdKeyHandler)] call CBA_fnc_removePerFrameHandler;
        GVAR(holdKeyHandler) = -1;
    };

    GVAR(currentMode) = _this;
    GVAR(holdKeyHandler) = [FUNC(onKeyHold), 0, _this] call CBA_fnc_addPerFrameHandler;
};

switch (_this select 0) do {
    case ("azimuth"): {
        GVAR(keyDownTabCountDistance) = 0;

        // handle input in option menu
        if (GVAR(currentMode) == "settings") exitWith {
            if (ACE_diagTime < GVAR(keyDownTimeMenu) + 1) exitWith {};

            if (ACE_diagTime < GVAR(keyDownTimeAzimuth) + 0.5) then {
                GVAR(keyDownTabCountAzimuth) = (GETGVAR(keyDownTabCountAzimuth,0)) + 1;
            } else {
                GVAR(keyDownTabCountAzimuth) = 1;
            };

            GVAR(keyDownTimeAzimuth) = ACE_diagTime;
        };

        if (GVAR(currentMode) == "config") exitWith {
            if (ACE_diagTime < GVAR(keyDownTimeMenu) + 0.5) exitWith {};

            ["config"] call FUNC(nextMode);
        };

        // prevent additinal modifier input if advanced mode it set, spaghetti
        if (GETGVAR(isKeyDownDistance,false) && {GETGVAR(currentMode,"") in ["relative_distance", "relative_height+length"]}) exitWith {};

        ["azimuth"] call FUNC(clearDisplay);

        GVAR(isKeyDownAzimuth) = true;
        [false] call FUNC(showP1);

        // handle 5 times clicking
        if (ACE_diagTime < GVAR(keyDownTimeAzimuth) + 0.5) then {
            GVAR(keyDownTabCountAzimuth) = (GETGVAR(keyDownTabCountAzimuth,0)) + 1;
            GVAR(keyDownTimeAzimuth) = ACE_diagTime;
        } else {
            GVAR(keyDownTabCountAzimuth) = 1;
        };

        // open settings menu
        if (GVAR(keyDownTabCountAzimuth) == 5) exitWith {
            GVAR(keyDownTimeMenu) = ACE_diagTime;
            GVAR(keyDownTimeAzimuth) = ACE_diagTime;
            GVAR(keyDownTabCountAzimuth) = 0;
            GVAR(configTemp) = [GVAR(useFeet), GVAR(useMil)];
            ["settings"] call FUNC(showText);
            "settings" call _fnc_setPFH;
        };

        if (ACE_diagTime < GVAR(keyDownTimeAzimuth) + 0.5) exitWith {
            "azimuth+inclination" call _fnc_setPFH;
        };

        GVAR(keyDownTimeAzimuth) = ACE_diagTime;

        if (ACE_diagTime > GVAR(keyDownTimeDistance) + 0.5) then {
            if !(GETGVAR(isKeyDownDistance,false)) then {
                ["distance"] call FUNC(clearDisplay);
                "azimuth" call _fnc_setPFH;
            };
        } else {
            if (GETGVAR(isKeyDownDistance,false)) then {
                "azimuth+distance" call _fnc_setPFH;
            } else {
                ["distance"] call FUNC(clearDisplay);
                "azimuth" call _fnc_setPFH;
            };
        };

    };

    case ("distance"): {
        GVAR(keyDownTabCountAzimuth) = 0;

        // handle input in option menu
        if (GVAR(currentMode) == "config") exitWith {
            if (ACE_diagTime < GVAR(keyDownTimeMenu) + 0.5) exitWith {};

            if (ACE_diagTime < GVAR(keyDownTimeDistance) + 0.5) then {
                GVAR(keyDownTabCountDistance) = (GETGVAR(keyDownTabCountDistance,0)) + 1;
            } else {
                GVAR(keyDownTabCountDistance) = 1;
            };

            GVAR(keyDownTimeDistance) = ACE_diagTime;
        };

        if (GVAR(currentMode) == "settings") exitWith {
            if (ACE_diagTime < GVAR(keyDownTimeMenu) + 0.5) exitWith {};

            ["settings"] call FUNC(nextMode);
        };

        // prevent additinal modifier input if advanced mode it set, spaghetti
        if (GETGVAR(isKeyDownAzimuth,false) && {GETGVAR(currentMode,"") in ["relative_azimuth+distance", "fall_of_shot"]}) exitWith {};

        // toggle fos values
        if (GETGVAR(currentMode,"") == "fall_of_shot") exitWith {
            [!(GETGVAR(FOSState,true))] call FUNC(showFallOfShot);
        };

        ["distance"] call FUNC(clearDisplay);

        GVAR(isKeyDownDistance) = true;
        [false] call FUNC(showP1);

        // handle 5 times clicking
        if (ACE_diagTime < GVAR(keyDownTimeDistance) + 0.5) then {
            GVAR(keyDownTabCountDistance) = (GETGVAR(keyDownTabCountDistance,0)) + 1;
            GVAR(keyDownTimeDistance) = ACE_diagTime;
        } else {
            GVAR(keyDownTabCountDistance) = 1;
        };

        // open config menu
        if (GVAR(keyDownTabCountDistance) == 5) exitWith {
            GVAR(keyDownTimeMenu) = ACE_diagTime;
            GVAR(keyDownTimeDistance) = ACE_diagTime;
            GVAR(keyDownTabCountDistance) = 0;
            GVAR(configTemp) = GVAR(modeReticle);
            ["config"] call FUNC(showText);
            "config" call _fnc_setPFH;
        };

        if (ACE_diagTime < GVAR(keyDownTimeDistance) + 0.5) exitWith {
            "height+distance" call _fnc_setPFH;
        };

        GVAR(keyDownTimeDistance) = ACE_diagTime;

        if (ACE_diagTime > GVAR(keyDownTimeAzimuth) + 0.5) then {
            if !(GETGVAR(isKeyDownAzimuth,false)) then {
                ["azimuth"] call FUNC(clearDisplay);
                "distance" call _fnc_setPFH;
            };
        } else {
            if (GETGVAR(isKeyDownAzimuth,false)) then {
                "azimuth+distance" call _fnc_setPFH;
            } else {
                ["azimuth"] call FUNC(clearDisplay);
                "distance" call _fnc_setPFH;
            };
        };

    };
};
