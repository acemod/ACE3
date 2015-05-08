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

_limit = 20000; // unrealistic amount since A3 max is 10000, helps in debug

if (!isNil QGVAR(moduleViewDistanceLimit)) then {
    _limit = GVAR(moduleViewDistanceLimit); // module value always takes priority over config
} else {
    // If the module is not present, take the value from the config instead
    _limit = [GVAR(viewDistanceLimit)] call FUNC(returnViewDistanceValue); // this function converts the array index in the config to it's relevant scalar value.
};

hint format ["[VD] Limit returned from module: %2 Local Limit: %3",GVAR(modulePresent),GVAR(moduleViewDistanceLimit),_limit]; // only used for debug, trying to get the module to work. Remember to remove before finalising pbo
diag_log format ["[VD] Limit returned from module: %2 Local Limit: %3",GVAR(modulePresent),GVAR(moduleViewDistanceLimit),_limit]; // only used for debug, trying to get the module to work. Remember to remove before finalising pbo

_limit;