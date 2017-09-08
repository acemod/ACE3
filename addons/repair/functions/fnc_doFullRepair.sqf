/*
 * Author: Glowbal
 * Fully repairs vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing (not used) <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle] call ace_repair_fnc_doFullRepair
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_vehicle"];
TRACE_1("params",_vehicle);

_vehicle setDamage 0;
