#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Converts Arma "Position" to ASL
 *
 * Arguments:
 * 0: position x <Number>
 * 1: position y <Number>
 * 2: position z <Number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, 1, 1] call ace_common_fnc_positionToASL
 *
 * Public: Yes
 */

if (surfaceIsWater _this) then {
    _this
} else {
    ATLtoASL _this
};
