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

if GVAR(modulePresent) then {
    // module always takes priority
    _view_distance_limit = 
} else {
    
};
// To do: add a check against a  module limit.