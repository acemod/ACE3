/*
 * Author: commy2
 *
 * Check if the unit can unload a captive from the vehicle.
 * 
 * Argument:
 * 0: Unit that wants to unload a captive (Object)
 * 1: Vehicle to unload a captive from. (Object)
 * 
 * Return value:
 * Boolean (Bool)
 */

private ["_unit", "_vehicle", "_cargo"];

_unit = _this select 0;
_vehicle = _this select 1;

_cargo = crew _vehicle;  // Can also unload from driver, gunner, commander, turret positions. They shouldn't be there anyway.

_cargo = [_cargo, {_this getVariable ["AGM_isCaptive", false]}] call AGM_Core_fnc_filter;

count _cargo > 0
