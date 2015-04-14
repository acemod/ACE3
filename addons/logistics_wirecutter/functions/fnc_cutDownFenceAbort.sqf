/*
 * Author: commy2
 * Stops cutting down fence (reset animation)
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_logistics_wirecutter_fnc_cutDownFenceAbort
 *
 * Public: No
 */
#include "script_component.hpp"

[ACE_player, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
