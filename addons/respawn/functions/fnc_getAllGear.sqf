/*
  Name: ACE_Respawn_fnc_getAllGear
  
  Author(s):
    bux578
  
  Description:
    returns an array containing all items of a given unit
  
  Parameters:
    0: OBJECT - unit
  
  Returns:
    ARRAY
*/

#include "script_component.hpp"

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
