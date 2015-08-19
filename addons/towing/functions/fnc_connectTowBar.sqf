/*
 * Author:
 * Connects a tow bar to a vehicle.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, player] call ace_towing_fnc_connectTowBar
 *
 * Public: no
 */
#include "script_component.hpp"

params ["_target", "_unit"];

diag_log "connectTowBar";
