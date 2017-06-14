/*
 * Author: Ruthberg
 * Shows/Hides add new gun controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_add_new_gun
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showAddNewGun) = _this;

{ctrlShow [_x, _this]} forEach [11000, 11001, 11002, 11003];
