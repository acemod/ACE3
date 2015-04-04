/*
 * Author: bux578
 *
 * Returns an array containing all items of a given unit
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Array with all the gear
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_unit);

[
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
]
