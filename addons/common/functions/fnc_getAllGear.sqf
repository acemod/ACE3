/*
 * Author: bux578, commy2
 *
 * Returns an array containing all items of a given unit
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Array with all the gear, format:
 *     0: headgear (String)
 *     1: goggles (String)
 *   2,3: uniform (String, Array)
 *   4,5: vest (String, Array)
 *   6,7: backpack (String, Array)
 *  8-10: rifle (String, Array, Array)
 * 11-13: launcher (String, Array, Array)
 * 14-16: pistol (String, Array, Array)
 *    17: map, compass, watch, etc. (Array)
 *    18: binocluar (String)
 *
 */
#include "script_component.hpp"

PARAMS_1(_unit);

if (isNull _unit) exitWith {[
    "",
    "",
    "", [],
    "", [],
    "", [],
    "", ["","","",""], [],
    "", ["","","",""], [],
    "", ["","","",""], [],
    [],
    ""
]};

[
    headgear _unit,
    goggles _unit,
    uniform _unit, uniformItems _unit,
    vest _unit, vestItems _unit,
    backpack _unit, backpackItems _unit,
    primaryWeapon _unit, primaryWeaponItems _unit, primaryWeaponMagazine _unit,
    secondaryWeapon _unit, secondaryWeaponItems _unit, secondaryWeaponMagazine _unit,
    handgunWeapon _unit, handgunItems _unit, handgunMagazine _unit,
    assignedItems _unit,
    binocular _unit
]
