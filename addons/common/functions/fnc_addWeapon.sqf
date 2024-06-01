#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Adds weapon to unit without taking a magazine.
 * Same as CBA_fnc_addWeaponWithoutItems, but doesn't remove linked items by default.
 *
 * Arguments:
 * 0: Unit to add the weapon to <OBJECT>
 * 1: Weapon to add <STRING>
 * 2: If linked items should be removed or not <BOOL> (default: false)
 * 3: Magazines that should be added to the weapon <ARRAY> (default: [])
 * - 0: Magazine classname <STRING>
 * - 1: Ammo count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "arifle_MX_GL_F", true, [["30Rnd_65x39_caseless_mag", 30], ["1Rnd_HE_Grenade_shell", 1]]] call ace_common_fnc_addWeapon
 *
 * Public: Yes
*/

params [
    ["_unit", objNull, [objNull]],
    ["_weapon", "", [""]],
    ["_removeLinkedItems", false, [false]],
    ["_magazines", [], [[]]]
];

if (isNull _unit || {_weapon == ""}) exitWith {};

// Config case
private _compatibleMagazines = compatibleMagazines _weapon;

private _uniform = uniformContainer _unit;
private _uniformMagazines = (magazinesAmmoCargo _uniform) select {
    (_x select 0) in _compatibleMagazines // Also config case
};

private _vest = vestContainer _unit;
private _vestMagazines = (magazinesAmmoCargo _vest) select {
    (_x select 0) in _compatibleMagazines
};

private _backpack = backpackContainer _unit;
private _backpackMagazines = (magazinesAmmoCargo _backpack) select {
    (_x select 0) in _compatibleMagazines
};

// Remove all compatible magazines
{
    _unit removeMagazines _x;
} forEach _compatibleMagazines;

// Add weapon
_unit addWeapon _weapon;

// This doesn't remove magazines, but linked items can't be magazines, so it's fine
if (_removeLinkedItems) then {
    switch (_weapon call FUNC(getConfigName)) do {
        case (primaryWeapon _unit): {
            removeAllPrimaryWeaponItems _unit;
        };
        case (secondaryWeapon _unit): {
            removeAllSecondaryWeaponItems _unit;
        };
        case (handgunWeapon _unit): {
            removeAllHandgunItems _unit;
        };
        case (binocular _unit): {
            removeAllBinocularItems _unit;
        };
    };
};

// Add magazines directly now, so that AI don't reload
if (_magazines isNotEqualTo []) then {
    {
        _x params [["_magazine", "", [""]], ["_ammoCount", -1, [0]]];

        if (_magazine != "" && {_ammoCount > -1}) then {
            _unit addWeaponItem [_weapon, [_magazine, _ammoCount], true];
        };
    } forEach _magazines;
};

// Add all magazines back
{
    _uniform addMagazineAmmoCargo [_x select 0, 1, _x select 1];
} forEach _uniformMagazines;

{
    _vest addMagazineAmmoCargo [_x select 0, 1, _x select 1];
} forEach _vestMagazines;

{
    _backpack addMagazineAmmoCargo [_x select 0, 1, _x select 1];
} forEach _backpackMagazines;
