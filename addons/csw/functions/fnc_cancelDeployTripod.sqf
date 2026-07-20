#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, johnb43
 * Cancels CSW tripod placement.
 *
 * Arguments:
 * 0: Key <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_csw_fnc_cancelDeployTripod
 *
 * Public: No
 */

params ["_key"];

if (_key != 1 || {GVAR(deployPFH) == -1}) exitWith {};

GVAR(placeAction) = PLACE_CANCEL;
