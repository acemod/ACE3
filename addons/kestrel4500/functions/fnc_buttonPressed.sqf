/*
 * Author: Ruthberg
 * Handles the Kestrel 4500 dialog button actions
 *
 * Arguments:
 * buttonID <integer>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * 2 call ace_kestrel4500_fnc_buttonPressed
 *
 * Public: No
 */
#include "script_component.hpp"

switch (_this) do {
    case 0: { // Enter
        if (!GVAR(MinAvgMax) && (GVAR(Menu) == 2 || GVAR(Menu) == 3)) then {
            GVAR(RefHeading) = getDir ACE_player;
        };
        if (GVAR(MinAvgMax) && GVAR(Menu) > 0 && GVAR(Menu) < 4) then {
            if (GVAR(MinAvgMaxMode) != 1) then {
                {
                    GVAR(MIN) set [_x, 0];
                    GVAR(MAX) set [_x, 0];
                    GVAR(TOTAL) set [_x, 0];
                    GVAR(ENTRIES) set [_x, 0];
                } forEach [1, 2, 3];
            };
            GVAR(MinAvgMaxMode) = (GVAR(MinAvgMaxMode) + 1) % 3;
        };
    };
    case 1: { // Top
        GVAR(Menu) = (GVAR(Menu) - 1 + (count GVAR(Menus))) % (count GVAR(Menus));
    };
    case 2: { // Bottom
        GVAR(Menu) = (GVAR(Menu) + 1 + (count GVAR(Menus))) % (count GVAR(Menus));
    };
    case 3: { // Left
        GVAR(MinAvgMax) = !GVAR(MinAvgMax);
    };
    case 4: { // Right
        GVAR(MinAvgMax) = !GVAR(MinAvgMax);
    };
    case 5: { // Memory
    };
    case 6: { // Backlight
    };
};

[] call FUNC(updateDisplay);
[] call FUNC(storeUserData);
