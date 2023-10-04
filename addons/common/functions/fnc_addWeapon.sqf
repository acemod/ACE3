#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Adds weapon to unit without taking a magazine.
 * Same as CBA_fnc_addWeaponWithoutItems, but doesn't remove linked items.
 *
 * Arguments:
 * 0: Unit to add the weapon to <OBEJCT>
 * 1: Weapon to add <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "arifle_AK12_F"] call ace_common_fnc_addWeapon
 *
 * Public: Yes
*/

params ["_unit", "_weapon"];

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
