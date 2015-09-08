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

#include "script_component.hpp"
params ["_player", "_target", "_weapon"];
private ["_compatibleMags", "_filterFunc", "_filteredMags", "_magToPass", "_magToPassIndex"];

_compatibleMags = getArray (configfile >> "CfgWeapons" >> _weapon >> "magazines");
_filterFunc = compile format ["((_this select 0) in %1) && !(_this select 2)", _compatibleMags];

_filteredMags = [magazinesAmmoFull _player, _filterFunc] call EFUNC(common,filter);

//select magazine with most ammo
_magToPass = _filteredMags select 0;
_magToPassIndex = 0;
{
    if ((_x select 1) > (_magToPass select 1)) then {
        _magToPass = _x;
        _magToPassIndex = _forEachIndex;
    };
} foreach _filteredMags;

//remove all magazines and add them again, except the one to be passed
//needed because of missing commands, see http://feedback.arma3.com/view.php?id=12782
_player removeMagazines (_magToPass select 0);
{
    if ((_x select 0) == (_magToPass select 0) && (_forEachIndex != _magToPassIndex)) then {
        _player addMagazine [_x select 0, _x select 1];
    };
} foreach _filteredMags;

_player playActionNow "PutDown";

_target addMagazine [_magToPass select 0, _magToPass select 1];
[[parseText format [CSTRING(PassMagazineHint), name _player, _magToPass select 0]], QUOTE(FUNC(common,displayTextStructured)), _target] call EFUNC(common,execRemoteFnc);