#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: LinkIsGrim
 * Switches the arsenal between displaying all items and favorites
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

private _firstRun = false;

if (isNil QGVAR(favoritesOnly)) then {
    GVAR(favoritesOnly) = GVAR(defaultToFavorites);
    _firstRun = true;
} else {
    GVAR(favoritesOnly) = !GVAR(favoritesOnly);
};

_control ctrlSetText format ["%1: %2", localize "STR_GEAR_ITEMS", localize (["str_word_all", "STR_3DEN_Favorite_textPlural"] select GVAR(favoritesOnly))];

if (_firstRun) exitWith {};

[false] call FUNC(refresh);
