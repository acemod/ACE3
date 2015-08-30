/*
 * Author: commy2
 * Unit unloads a captive from a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a captive <OBJECT>
 * 1: A captive loaded in a vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, prisoner] call ACE_captives_fnc_doUnloadCaptive
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

["MoveOutCaptive", [_target], [_target]] call EFUNC(common,targetEvent);
