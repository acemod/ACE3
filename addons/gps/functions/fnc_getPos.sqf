#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Get GPS position with random error
 *
 * This number does not have any real world correlation
 *
 * Arguments:
 * Object with GPS <OBJECT>
 *
 * Return Value:
 * Error <NUMBER>
 *
 * Example:
 * [_unit] call ace_gps_fnc_getPos
 *
 * Public: Yes
 */

params [
    ["_object", ACE_player, [objNull]]
];

_object getPos ([_object] call FUNC(getOffset));
