/*
 * Author: esteldunedain
 * Converts ASL to Arma "Position"
 *
 * Arguments:
 * 0: position x <Number>
 * 1: position y <Number>
 * 2: position z <Number>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (surfaceIsWater _this) then {
    _this
} else {
    ASLtoATL _this
};
