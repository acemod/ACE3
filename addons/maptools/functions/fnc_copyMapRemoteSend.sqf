/*
 * Author: esteldunedain
 *
 * Send Map markers to other player
 *
 * Argument:
 * 0: Target player (Unit)
 *
 * Return value:
 * Return
 */

#include "script_component.hpp"

params ["_requester"];

["drawing_sendbackMarkers", [GVAR(drawing_lineMarkers)], _requester] call CBA_fnc_targetEvent;
