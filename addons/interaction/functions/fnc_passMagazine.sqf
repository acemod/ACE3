#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Pass spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that passes the magazine <OBJECT>
 * 1: Unit to pass the magazine to <OBJECT>
 * 2: Weapon classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "arifle_MX_F"] call ace_interaction_fnc_magToPassazine
 *
 * Public: No
 */
params ["_player", "_target", "_weapon"];

private _compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
private _filteredMags = magazinesAmmoFull _player select {(_x select 0) in _compatibleMags && {!(_x select 2)}};

//select magazine with most ammo
private _magToPass = _filteredMags select 0;
private _magToPassIndex = 0;
{
    _x params ["_className", "_ammoCount"];
    if ((_ammoCount > (_magToPass select 1)) && (_target canAdd _className)) then {
        _magToPass = _x;
        _magToPassIndex = _forEachIndex;
    };
} foreach _filteredMags;

//remove all magazines and add them again, except the one to be passed
//needed because of missing commands, see http://feedback.arma3.com/view.php?id=12782
_magToPass params ["_magToPassClassName", "_magToPassAmmoCount"];
_player removeMagazines _magToPassClassName;
{
    _x params ["_className", "_ammoCount"];
    if ((_className == _magToPassClassName) && (_forEachIndex != _magToPassIndex)) then {
        _player addMagazine [_className, _ammoCount];
    };
} foreach _filteredMags;

[_player, "PutDown"] call EFUNC(common,doGesture);

_target addMagazine [_magToPassClassName, _magToPassAmmoCount];

private _playerName = [_player] call EFUNC(common,getName);
private _magToPassDisplayName = getText (configFile >> "CfgMagazines" >> _magToPassClassName >> "displayName");
[QEGVAR(common,displayTextStructured), [[LSTRING(PassMagazineHint), _playerName, _magToPassDisplayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
