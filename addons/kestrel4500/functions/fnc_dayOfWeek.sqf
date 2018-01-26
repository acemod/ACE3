/*
 * Author: Ruthberg
 * Calculate Current Day in the Week
 *
 * Arguments:
 * 0: Year <NUMBER>
 * 1: Month <NUMBER>
 * 2: Day <NUMBER>
 *
 * Return Value:
 * Day of The Week <NUMBER>
 *
 * Example:
 * [1995, 10, 21] call ace_kestrel4500_fnc_buttonPressed
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_year", "_month", "_day"];

private _table = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
if (_month < 3) then {
    _year = _year - 1;
};
(_year + floor(_year/4) - floor(_year/100) + floor(_year/400) + (_table select (_month - 1)) + _day) % 7
