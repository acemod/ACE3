/*
 * Author: Winter
 * Returns the view distance limit depending on either the config or (if present) the module.
 * 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * View Distance Limit <SCALAR>
 *
 * Example:
 * [] call ace_viewdistance_fnc_returnViewDistanceLimit;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_limit"];

_limit = 20000; // unrealistic amount for debug

if (!isNil QGVAR(moduleViewDistanceLimit)) then {
    _limit = GVAR(moduleViewDistanceLimit); // module always takes priority
} else {
    // if module is not present, take the value from the config instead
    _limit = [GVAR(viewDistanceLimit)] call FUNC(returnViewDistanceValue); // this function converts the array index in the config to it's relevant scalar value.
};

hint format ["[VD] Limit returned from module: %2 Local Limit: %3",GVAR(modulePresent),GVAR(moduleViewDistanceLimit),_limit];
diag_log format ["[VD] Limit returned from module: %2 Local Limit: %3",GVAR(modulePresent),GVAR(moduleViewDistanceLimit),_limit];

_limit;