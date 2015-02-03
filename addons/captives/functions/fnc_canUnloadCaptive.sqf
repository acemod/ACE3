/*
 * Author: commy2
 * Check if the unit can unload a captive from the vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a captive <OBJECT>
 * 1: A captive. ObjNull for the first escorted captive <OBJECT>
 * 2: Vehicle to unload a captive from <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_cargo"];

PARAMS_2(_unit,_vehicle);

_cargo = crew _vehicle;  // Can also unload from driver, gunner, commander, turret positions. They shouldn't be there anyway.

_cargo = [_cargo, {_this getVariable ["ACE_isCaptive", false]}] call EFUNC(common,filter);

count _cargo > 0
