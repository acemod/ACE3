#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Name of mode ("settings", "config") <STRING>
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * ["settings"] call ace_vector_fnc_nextMode
 *
 * Public: No
 */

switch (_this select 0) do {
    case ("settings"): {
        switch (GVAR(configTemp)) do {
            case ([false, false]): {
                GVAR(configTemp) = [false, true];
            };
            case ([false, true]): {
                GVAR(configTemp) = [true, true];
            };
            case ([true, true]): {
                GVAR(configTemp) = [true, false];
            };
            case ([true, false]): {
                GVAR(configTemp) = [false, false];
            };
        };

        [["meter", "feet"] select (GVAR(configTemp) select 0)] call FUNC(showText);
        [["deg",   "mil" ] select (GVAR(configTemp) select 1)] call FUNC(showText);
    };

    case ("config"): {
        GVAR(configTemp) = GVAR(configTemp) + 1;
        if (GVAR(configTemp) > 2) then {GVAR(configTemp) = 0};

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
    };
};
