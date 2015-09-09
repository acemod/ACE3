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

["drawing_sendbackMarkers", _requester, [GVAR(drawing_lineMarkers)]] call EFUNC(common,targetEvent);
