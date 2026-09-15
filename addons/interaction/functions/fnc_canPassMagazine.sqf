#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if unit has a spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that passes the magazine <OBJECT>
 * 1: Unit to pass the magazine to <OBJECT>
 * 2: Weapon classname <STRING>
 *
 * Return Value:
 * Unit can pass magazine <BOOL>
 *
 * Example:
 * [player, cursorObject, "arifle_MX_F"] call ace_interaction_fnc_canPassMagazine
 *
 * Public: No
 */

params ["_player", "_target", "_weapon"];

GVAR(enableMagazinePassing) &&
{_weapon != ""} &&
{_target call EFUNC(common,isAwake)} &&
{(objectParent _target) isEqualTo (objectParent _player)} &&
{
    private _compatibleMags = compatibleMagazines _weapon;

    ([_player, 2] call EFUNC(common,uniqueItems)) findIf {
        _x in _compatibleMags && {_target canAdd [_x, 1, true]}
    } != -1
}
