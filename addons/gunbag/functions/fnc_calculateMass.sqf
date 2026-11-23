#include "..\script_component.hpp"
/*
 * Author: Ir0n1E
 * Calculate mass of weapon and items.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Items <ARRAY>
 * 2: Magazines, as classnames or [classname, ammo] (empty entries are skipped) <ARRAY>
 *
 * Return Value:
 * Mass <NUMBER>
 *
 * Example:
 * ["weapon", ["item1", "item2"], [["mag1", 30], []]] call ace_gunbag_fnc_calculateMass
 *
 * Public: No
 */

params [["_weapon", "", [""]], ["_items", [], [[]]], ["_magazines", [], [[]]]];

private _mass = getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass");

{
    if (_x isEqualType "" && {_x != ""}) then {
        _mass = _mass + getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
    };
} forEach _items;

{
    // Empty magazine slots are [] in getUnitLoadout, and nil after "apply {_x select 0}"
    if (isNil "_x") then {continue};

    private _magazine = _x;

    if (_magazine isEqualType []) then {
        _magazine = _magazine param [0, ""];
    };

    if (_magazine isEqualType "" && {_magazine != ""}) then {
        _mass = _mass + getNumber (configFile >> "CfgMagazines" >> _magazine >> "mass");
    };
} forEach _magazines;

_mass
