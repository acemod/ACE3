/*
 * Author: Ruthberg
 * Updates all target column input fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_target
 *
 * Public: No
 */
#include "script_component.hpp"

ctrlSetText [300, Str(Round((GVAR(windSpeed1) select GVAR(currentTarget)) * 100) / 100)];
ctrlSetText [310, Str(Round((GVAR(windDirection) select GVAR(currentTarget))))];
ctrlSetText [320, Str(Round((GVAR(inclinationAngle) select GVAR(currentTarget))))];
ctrlSetText [330, Str(Round((GVAR(targetSpeed) select GVAR(currentTarget)) * 100) / 100)];
ctrlSetText [340, Str(Round((GVAR(targetRange) select GVAR(currentTarget))))];
