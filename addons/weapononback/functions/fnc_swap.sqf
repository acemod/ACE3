#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Swaps primary and weapon on back. Can handle no primary or no weapon on back.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _oldPrimary = (getUnitLoadout ACE_player)#0;
private _newPrimary = [ACE_player] call FUNC(get);

// Save scope adjustment
private _adjustments = ACE_player getVariable [QEGVAR(scopes,adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _oldAdjustment = _adjustments#0;
private _newAdjustement = ACE_player getVariable [QGVAR(scopeAdjustment), [0, 0, 0]];
EGVAR(scopes,guns) set [0, ""];

ACE_player removeWeapon (_oldPrimary param [0, ""]);

if !(_newPrimary isEqualTo []) then {
    _newPrimary params ["_weapon"];

    // addWeapon is going to eat a mag for each muzzle before we can fill the weapon with addWeaponItem
    // Because of that, we need to save where that mag was taken from and readd it
    private _containerMags = [
        uniformContainer ACE_player,
        vestContainer ACE_player,
        backpackContainer ACE_player
    ] apply {magazinesAmmo  _x};

    ACE_player addWeapon _weapon;

    // Readd lost magazines
    {
        private _container = _x;
        private _before = _containerMags#_forEachIndex;
        private _after = magazinesAmmo _container;

        {
            _before deleteAt (_before find _x);
        } forEach _after;

        {
            _container addMagazineAmmoCargo [_x#0, 1, _x#1];
        } forEach _before;
    } forEach [
        uniformContainer ACE_player,
        vestContainer ACE_player,
        backpackContainer ACE_player
    ];

    removeAllPrimaryWeaponItems ACE_player;
    {
        ACE_player addWeaponItem [_weapon, _x, true];
    } forEach (_newPrimary select [1, 6]);

    ACE_player selectWeapon _weapon;

    // Restore scope adjustment
    [{
        EGVAR(scopes,guns)#0 != ""
    }, {
        params ["_oldAdjustment", "_newAdjustement"];

        if !(_newAdjustement isEqualTo [0, 0, 0]) then {
            private _scopeAdjustmentParams = [ACE_player];
            _scopeAdjustmentParams append _newAdjustement;
            _scopeAdjustmentParams call EFUNC(scopes,applyScopeAdjustment);
        };

        ACE_player setVariable [QGVAR(scopeAdjustment), _oldAdjustment];
    }, [_oldAdjustment, _newAdjustement]] call CBA_fnc_waitUntilAndExecute;
};

if (_oldPrimary isEqualTo []) then {
    [ACE_player] call FUNC(remove);
} else {
    [ACE_player, _oldPrimary] call FUNC(add);
};
