/*
 * Author: commy2
 * Unit unloads a captive from a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a captive <OBJECT>
 * 1: Vehicle to unload a captive from. <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, car] call ACE_captives_fnc_doUnloadCaptive
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_vehicle);

private ["_cargo", "_target"];

_cargo = crew _vehicle;  // Can also unload from driver, gunner, commander, turret positions. They shouldn't be there anyway.

_cargo = [_cargo, {_this getVariable [QGVAR(isHandcuffed), false]}] call EFUNC(common,filter);

if ((count _cargo) > 0) then {
    _target = _cargo select 0;
    ["MoveOutCaptive", [_target], [_target]] call EFUNC(common,targetEvent);
} else {
    ERROR("No captive to unload");
};
