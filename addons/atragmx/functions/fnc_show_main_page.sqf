/*
 * Author: Ruthberg
 * Shows/Hides the main menu controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_main_page
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showMainPage) = _this;

{ctrlShow [_x, _this]} forEach [10, 100, 11, 110, 12, 120, 13, 130, 14, 140, 20, 200, 21, 210, 22, 220, 23, 230, 30, 300, 31, 310, 32, 320, 33, 330, 34, 340, 40, 400, 401, 402, 403, 41, 410, 411, 412, 42, 420,
                                500, 501, 502, 503, 600, 601, 602, 603, 1000, 1001, 1002, 1003, 1004, 2000, 2001, 3000, 4000, 4001, 4002, 4003, 4004, 4005, 4006, 4007, 4008];

if (_this) then {
    if (GVAR(showCoriolis)) then {
        ctrlSetText [4003, "Hold"];
        ctrlSetText [4004, "Cor"];
        ctrlSetText [4005, "Spin"];
        {ctrlShow [_x, false]} forEach [402, 4006, 4007];
    } else {
        ctrlSetText [4003, "Abs"];
        ctrlSetText [4004, "Rel"];
        ctrlSetText [4005, "Cur"];
        private _visible = (GVAR(currentScopeUnit) == 3);
         {ctrlShow [_x, _visible]} forEach [401, 402, 411, 412, 4004, 4005, 4006, 4007];
    };
    if (GVAR(atmosphereModeTBH)) then {
        {ctrlShow [_x, false]} forEach [23, 230];
    } else {
        {ctrlShow [_x, false]} forEach [21, 210, 22, 220];
    };
    if (GVAR(currentScopeUnit) != 3) then {
        {ctrlShow [_x, false]} forEach [2001];
    };
};
