/*
 * Author: TCVM
 * Deploys the CSW Tripod after it has been moved
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 *
 * Return Value:
 * Can move tripod <BOOL>
 *
 * Example:
 * [tripod] call ace_csw_fnc_canMoveTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params["_player"];

isNull GVAR(cswTripod);

