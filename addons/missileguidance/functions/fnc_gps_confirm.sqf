#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Confirm GPS weapon settings and serialize to variables
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_confirm
 *
 * Public: No
 */
if (GVAR(gps_mode) isEqualTo "pb") then {
    [GVAR(gps_pbMode)] call FUNC(gps_saveAttackSettings);
};
closeDialog 0;

