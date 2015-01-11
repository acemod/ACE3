/*
 * Author: KoffeinFlummi
 *
 * Unloads the wounded units from the vehicle.
 *
 * Arguments:
 * 0: The unit that does the unloading
 * 1: The vehicle
 *
 * Return Value:
 * -
 */

 private ["_unit", "_vehicle", "_pos"];

_unit = _this select 0;
_vehicle = _this select 1;

if (count _this > 2) exitWith {
  _target = _this select 2;
  _pos = [
    (getPos _unit select 0) + (random 2) - 1,
    (getPos _unit select 1) + (random 2) - 1,
    0
  ];
  moveOut _target;
  unassignVehicle _target;
  _target setPosATL _pos;
};

{
  if (_x getVariable ["AGM_isUnconscious", False]) then {
    [_this + [_x], "AGM_Medical_fnc_unloadPatients", _x] call AGM_Core_fnc_execRemoteFnc;
    _x setVariable ["AGM_OriginalAnim", "AmovPpneMstpSnonWnonDnon", True];
  };
} forEach crew _vehicle;
