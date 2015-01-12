/*
Author: bux578

Description:
Returns an array containing all items of a given unit

Arguments:
A player object

Return value:
An array containing all inventory items
*/

private ["_unit", "_allGear"];

_unit = _this select 0;

_allGear = [
  (headgear _unit),
  (goggles _unit),
  (uniform _unit),
  (uniformItems _unit),
  (vest _unit),
  (vestItems _unit),
  (backpack _unit),
  (backpackItems _unit),
  (primaryWeapon _unit),
  (primaryWeaponItems _unit),
  (primaryWeaponMagazine _unit),
  (secondaryWeapon _unit),
  (secondaryWeaponItems _unit),
  (secondaryWeaponMagazine _unit),
  (handgunWeapon _unit),
  (handgunItems _unit),
  (handgunMagazine _unit),
  (assignedItems _unit),
  (binocular _unit)
];

_allGear
