#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Pass spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that passes the magazine <OBJECT>
 * 1: Unit to pass the magazine to <OBJECT>
 * 2: Weapon classname <STRING>
 * 3: Play passing animation <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "arifle_MX_F"] call ace_interaction_fnc_passMagazine
 *
 * Public: No
 */

params ["_player", "_target", "_weapon", ["_animate", true]];

private _compatibleMags = compatibleMagazines _weapon;
private _filteredMagazines = (magazinesAmmoFull _player) select {
    _x params ["_className", "", "_loaded"];

    !_loaded && {_className in _compatibleMags} && {_target canAdd [_className, 1, true]}
};

// If no magazines are available, quit
if (_filteredMagazines isEqualTo []) exitWith {};

// Select magazine with most ammo
private _magToPassClassName = _filteredMagazines select 0 select 0;
private _magToPassAmmoCount = selectMax (_filteredMagazines apply {_x select 1});

// Remove magazine from player; If failure, quit
if !([_player, _magToPassClassName, _magToPassAmmoCount] call EFUNC(common,removeSpecificMagazine)) exitWith {};

if (_animate) then {[_player, "PutDown"] call EFUNC(common,doGesture)};

_target addMagazine [_magToPassClassName, _magToPassAmmoCount];

private _playerName = _player call EFUNC(common,getName);
private _displayName = getText (configFile >> "CfgMagazines" >> _magToPassClassName >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(PassMagazineHint), _playerName, _displayName], 1.5, _target], _target] call CBA_fnc_targetEvent;
