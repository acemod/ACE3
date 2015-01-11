/*
 * Author: commy2
 *
 * Replace the disposable launcher with the used dummy.
 * 
 * Argument:
 * Input from "Fired" eventhandler
 * 
 * Return value:
 * Nothing
 */

private ["_unit", "_tube", "_projectile"];

_unit = _this select 0;
_tube = getText (configFile >> "CfgWeapons" >> _this select 1 >> "AGM_UsedTube");
_projectile = _this select 6;

if (_tube == "") exitWith {};

private "_items";

_items = secondaryWeaponItems _unit;

_unit addWeapon _tube;
_unit selectWeapon _tube;
{
  if (_x != "") then {_unit addSecondaryWeaponItem _x};
} forEach _items;

// AI
if !([_unit] call AGM_Core_fnc_isPlayer) then {
  [_unit, _tube, _projectile] spawn {
    _unit = _this select 0;
    _tube = _this select 1;
    _projectile = _this select 2;

    waitUntil {isNull _projectile};
    sleep 1;

    if (secondaryWeapon _unit == _tube) then {
      _logic = createVehicle ["GroundWeaponHolder", position _unit, [], 0, "CAN_COLLIDE"];
      _logic addWeaponCargoGlobal [_tube, 1];  // @todo secondary weapon items

      _unit removeWeapon _tube;
    };
  };
};
