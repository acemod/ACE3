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
 * [_player, _target, "arifle_MX_F"] call ace_interaction_fnc_passMagazine
 *
 * Public: No
 */
params ["_player", "_target", "_weapon", ["_animate", true, [true]]];

private _compatibleMags = [_weapon] call CBA_fnc_compatibleMagazines;
private _filteredMags = magazinesAmmoFull _player select {
    _x params ["_className", "", "_loaded"];
    (_className in _compatibleMags) && {!_loaded} && {[_target, _className] call CBA_fnc_canAddItem}
};

//select magazine with most ammo
private _magToPass = _filteredMags select 0;
{
    _x params ["_className", "_ammoCount"];
    if (_ammoCount > (_magToPass select 1)) then {
        _magToPass = _x;
    };
} forEach _filteredMags;

//remove the magazine from _player and add it to _target
_magToPass params ["_magToPassClassName", "_magToPassAmmoCount"];
// Exit if failed to remove specific magazine
if !([_player, _magToPassClassName, _magToPassAmmoCount] call EFUNC(common,removeSpecificMagazine)) exitWith {};

if (_animate) then {[_player, "PutDown"] call EFUNC(common,doGesture)};

_target addMagazine [_magToPassClassName, _magToPassAmmoCount];

private _playerName = [_player] call EFUNC(common,getName);
private _magToPassDisplayName = getText (configFile >> "CfgMagazines" >> _magToPassClassName >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(PassMagazineHint), _playerName, _magToPassDisplayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
