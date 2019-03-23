#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Converts ASL to Arma "Position"
 *
 * Arguments:
 * 0: position x <NUMBER>
 * 1: position y <NUMBER>
 * 2: position z <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, 2, 3] call ace_common_fnc_ASLToPosition
 *
 * Public: No
 */

if (surfaceIsWater _this) then {
    _this
} else {
    ASLtoATL _this
};
