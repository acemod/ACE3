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

[GVAR(lineMarkers), "AGM_Map_fnc_copyMapMarkers", _this] call AGM_Core_fnc_execRemoteFnc;
