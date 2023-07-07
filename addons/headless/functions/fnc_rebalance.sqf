#include "script_component.hpp"
/*
 * Author: Jonpas
 * Rebalance AI groups accross HCs.
 *
 * Arguments:
 * 0: Force <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_headless_fnc_rebalance
 *
 * Public: No
 */

params ["_force"];

TRACE_3("Rebalance",GVAR(inRebalance),GVAR(headlessClients),_force);

// Exit if waiting for rebalance or no HCs present
if (GVAR(inRebalance) || {GVAR(headlessClients) isEqualTo []}) exitWith {};

// Transfer after rebalance delay
[FUNC(transferGroups), [_force], XGVAR(Delay)] call CBA_fnc_waitAndExecute;

// Currently in rebalance flag
GVAR(inRebalance) = true;
