#include "script_component.hpp"
/*
 * Author: commy2
 * Unit unloads a captive from a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a captive <OBJECT>
 * 1: A captive loaded in a vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, prisoner] call ACE_captives_fnc_doUnloadCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];

[QGVAR(moveOutCaptive), [_target], [_target]] call CBA_fnc_targetEvent;
