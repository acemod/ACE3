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
            switch (GVAR(referenceHeadingMenu)) do {
                case 0: { // Head- and Crosswind main page
                    GVAR(TmpHeading) = GVAR(RefHeading);
                    GVAR(referenceHeadingMenu) = 1;
                };
                case 1: { // Mode selection
                    if (GVAR(referenceHeadingAutoSet)) then {
                        GVAR(referenceHeadingMenu) = 2;
                    } else {
                        GVAR(referenceHeadingMenu) = 3;
                    };
                };
                case 2: { // Auto set
                    GVAR(RefHeading) = getDir ACE_player;
                    GVAR(referenceHeadingMenu) = 0;
                    GVAR(headingSetDisplayTimer) = diag_tickTime;
                };
                case 3: { // Manual set
                    GVAR(RefHeading) = GVAR(TmpHeading);
                    GVAR(referenceHeadingMenu) = 0;
                    GVAR(headingSetDisplayTimer) = diag_tickTime;
                };
            };
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
        if (GVAR(referenceHeadingMenu) == 1) then {
            GVAR(referenceHeadingAutoSet) = !GVAR(referenceHeadingAutoSet);
        } else {
            GVAR(Menu) = (GVAR(Menu) - 1 + (count GVAR(Menus))) % (count GVAR(Menus));
        };
    };
    case 2: { // Bottom
        if (GVAR(referenceHeadingMenu) == 1) then {
            GVAR(referenceHeadingAutoSet) = !GVAR(referenceHeadingAutoSet);
        } else {
            GVAR(Menu) = (GVAR(Menu) + 1 + (count GVAR(Menus))) % (count GVAR(Menus));
        };
    };
    case 3: { // Left
        if (GVAR(referenceHeadingMenu) == 0) then {
            GVAR(MinAvgMax) = !GVAR(MinAvgMax);
        } else {
            if (GVAR(referenceHeadingMenu) == 3) then {
                if (diag_tickTime - GVAR(manualSetCooldown) < 0.2) then {
                    GVAR(TmpHeading) = GVAR(TmpHeading) - 10;
                } else {
                    GVAR(TmpHeading) = GVAR(TmpHeading) - 1;
                };
                GVAR(manualSetCooldown) = diag_tickTime;
            };
        };
    };
    case 4: { // Right
        if (GVAR(referenceHeadingMenu) == 0) then {
            GVAR(MinAvgMax) = !GVAR(MinAvgMax);
        } else {
            if (GVAR(referenceHeadingMenu) == 3) then {
                if (diag_tickTime - GVAR(manualSetCooldown) < 0.2) then {
                    GVAR(TmpHeading) = GVAR(TmpHeading) + 10;
                } else {
                    GVAR(TmpHeading) = GVAR(TmpHeading) + 1;
                };
                GVAR(manualSetCooldown) = diag_tickTime;
            };
        };
    };
    case 5: { // Memory
    };
    case 6: { // Backlight
    };
    case 7: { // Exit
        private ["_exit"];
        _exit = true;
        if (GVAR(referenceHeadingMenu) == 1) then {
            GVAR(referenceHeadingMenu) = 0;
            _exit = false;
        };
        if (GVAR(referenceHeadingMenu) > 1) then {
            GVAR(referenceHeadingMenu) = 1;
            _exit = false;
        };
        if (_exit) then {
            closeDialog 0;
        };
    };
};

[] call FUNC(updateDisplay);
[] call FUNC(storeUserData);
