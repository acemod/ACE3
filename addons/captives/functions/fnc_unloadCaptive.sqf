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
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_vehicle);

private ["_cargo", "_target"];

_cargo = crew _vehicle;  // Can also unload from driver, gunner, commander, turret positions. They shouldn't be there anyway.

_cargo = [_cargo, {_this getVariable ["ACE_isCaptive", false]}] call EFUNC(common,filter);

if (count _cargo > 0) then {
  _target = _cargo select 0;

  _target setVariable ["ACE_Captives_CargoIndex", -1, true];

  moveOut _target;
  [_target, "ACE_AmovPercMstpScapWnonDnon", 2] call EFUNC(common,doAnimation);
  [_target, "{unassignVehicle _this}", _target] call ACE_Core_fnc_execRemoteFnc;
};
