/*
 * Author: KoffeinFlummi
 *
 * Finds out the hitpoint classname of the given selection.
 * (works only for main and MainTurret hitpoints)
 *
 * Arguments:
 * 0: Vehicle
 * 1: Selection name
 *
 * Return Value:
 * None
 */

private ["_vehicle", "_selectionName"];

_vehicle = _this select 0;
_selectionName = _this select 1;

_vehicleConfig = configFile >> "CfgVehicles" >> typeOf _vehicle;
_hitPoints = ("True" configClasses (_vehicleConfig >> "HitPoints")) +
  ("True" configClasses (_vehicleConfig >> "Turrets" >> "MainTurret" >> "HitPoints"));

_hitPoint = "";
for "_i" from 0 to (count _hitPoints - 1) do {
  if (getText ((_hitPoints select _i) >> "name") == _selectionName) exitWith {
    _hitPoint = configName (_hitPoints select _i);
  };
};

_hitPoint
