/*
 * Author: bux578, commy2
 * Returns an array containing all items of a given unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 *  0: Headgear <STRING>
 *  1: Goggles <STRING>
 *  2: Uniform <STRING>
 *  3: Uniform Items <ARRAY>
 *  4: Vest <String>
 *  5: Vest Items <ARRAY>
 *  6: Backback <STRING>
 *  7: Backpack Items <ARRAY>
 *  8: Rifle <STRING>
 *  9: Rifle Items <ARRAY>
 * 10: Rifle Magazines <ARRAY>
 * 11: Launcher <STRING>
 * 12: Launcher Items <ARRAY>
 * 13: Launcher Magazines <ARRAY>
 * 14: Handgun <STRING>
 * 15: Handgun Items <ARRAY>
 * 16: Handgun Magazines <ARRAY>
 * 17: Assigned Items (map, compass, watch, etc.) <ARRAY>
 * 18: Binoculars <STRING>
 * 19: Binocular Magazine (E.g. Laserbatteries) <STRING>
 *
 * Public: Yes
 *
 * Note: Element 17 includes the Head Mounted Display (HMD)
 */
#include "script_component.hpp"

params ["_unit"];

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
    "",
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
    binocular _unit,
    [_unit] call FUNC(binocularMagazine)
]
