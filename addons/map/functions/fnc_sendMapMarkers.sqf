/*
 * Author: CAA-Picard
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

[GVAR(drawing_lineMarkers), QFUNC(copyMapMarkers), _this] call EFUNC(common,execRemoteFnc);
