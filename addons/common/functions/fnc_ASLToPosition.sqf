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
 * Public: No
 */
#include "script_component.hpp"

if (surfaceIsWater _this) then {
    _this
} else {
    ASLtoATL _this
};
