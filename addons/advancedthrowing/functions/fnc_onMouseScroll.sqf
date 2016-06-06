/*
 * Author: Dslyecxi, Jonpas
 * Mouse scroll wheel changed event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advancedthrowing_fnc_onMouseScroll
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(inHand)) exitWith {};

params ["", "_amount"];

if (GVAR(dropMode)) then {
    if (_amount < 0) then {
        // Move closer
        GVAR(dropDistance) = (GVAR(dropDistance) - 0.1) max 0.2;
    } else {
        // Move further
        GVAR(dropDistance) = (GVAR(dropDistance) + 0.1) min 1;
    };

    // Limit distance in vehicle
    if (vehicle ACE_player != ACE_player) then {
        GVAR(dropDistance) = GVAR(dropDistance) min 0.5;
    };
} else {
    if (_amount < 0) then {
        if (GVAR(throwType) == "high") then {
            GVAR(throwType) = "normal";
        };
    } else {
        if (GVAR(throwType) == "normal") then {
            GVAR(throwType) = "high";
        };
    };
    TRACE_2("Change Throw Type",_amount,GVAR(throwType));
};
