#include "script_component.hpp"
/*
 * Author: commy2
 * Handles releasing the special vector keys.
 *
 * Arguments:
 * 0: String <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["5"] call ace_vector_fnc_onKeyUp
 *
 * Public: No
 */

private _fnc_setPFH = {
    if (GVAR(holdKeyHandler) > -1) then {
        [GVAR(holdKeyHandler)] call CBA_fnc_removePerFrameHandler;
        GVAR(holdKeyHandler) = -1;
    };

    GVAR(currentMode) = _this;//
    GVAR(holdKeyHandler) = [FUNC(onKeyHold), 0, _this] call CBA_fnc_addPerFrameHandler;
};

switch (_this select 0) do {
    case ("azimuth"): {

        GVAR(isKeyDownAzimuth) = false;

        if (GVAR(isKeyDownDistance)) then {

            switch (GVAR(currentMode)) do {
                case ("distance"): {
                    ["azimuth"] call FUNC(clearDisplay);
                    [true] call FUNC(showP1);
                    GVAR(pData) = [call FUNC(getDistance), call FUNC(getDirection)];
                    "relative_distance" call _fnc_setPFH;
                };

                case ("height+distance"): {
                    ["azimuth"] call FUNC(clearDisplay);
                    [true] call FUNC(showP1);
                    GVAR(pData) = [call FUNC(getDistance), call FUNC(getDirection)];
                    "relative_height+length" call _fnc_setPFH;
                };
            };

        };

    };

    case ("distance"): {

        GVAR(isKeyDownDistance) = false;

        if (GVAR(isKeyDownAzimuth)) then {

            switch (GVAR(currentMode)) do {
                case ("azimuth"): {
                    ["azimuth"] call FUNC(clearDisplay);
                    ["distance"] call FUNC(clearDisplay);
                    [true] call FUNC(showP1);
                    GVAR(pData) = [call FUNC(getDistance), call FUNC(getDirection)];
                    "relative_azimuth+distance" call _fnc_setPFH;
                };

                case ("azimuth+inclination"): {
                    ["azimuth"] call FUNC(clearDisplay);
                    ["distance"] call FUNC(clearDisplay);
                    [true] call FUNC(showP1);
                    GVAR(pData) = [call FUNC(getDistance), call FUNC(getDirection)];
                    "fall_of_shot" call _fnc_setPFH;
                };
            };

        };

    };
};
