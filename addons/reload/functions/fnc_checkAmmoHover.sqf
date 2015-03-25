/*
 * Author: PabstMirror
 * Show the ammo counts for a static weapon.
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Parms? (unused) <ANY>
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

PARAMS_3(_target,_player,_params);

//For self interaction, get the player's vehicle
if (_player == _target) then {
    _target = vehicle _player;
};

//Get counts for each ammo types (merged if they have the same displaynameshort)
_extraMagainzesNames = [];
_extraMagainzesCounts = [];
{
    EXPLODE_5_PVT(_x,_xClassName,_xAmmo,_xState,_xType,_xLocation);
    _name = getText (configFile >> "CfgMagazines" >> _xClassName >> "displaynameshort");
    _index = _extraMagainzesNames find _name;
    if (_index == -1) then {
        _extraMagainzesNames pushBack _name;
        _extraMagainzesCounts pushBack _xAmmo;
    } else {
        _extraMagainzesCounts set [_index, ((_extraMagainzesCounts select _index) + _xAmmo)];
    };
} forEach (magazinesAmmoFull _target);

_actions = [];
{
    _ammoCount = _extraMagainzesCounts select _forEachIndex;
    if (_ammoCount > 50) then {
        if (_ammoCount < 300) then {
            //above 50, give a rough estimate
            _ammoCount = 10 * floor (_ammoCount / 10);
        } else {
            //above 300, give a more rough estimate
            _ammoCount = 50 * floor (_ammoCount / 50);
        };
    };
    _display = format ["%1x<br/>%2", _ammoCount, _x];
    _magAction = [_x, _display, "", {_nul = 0;}, {true}, {}] call EFUNC(interact_menu,createAction);
    _actions pushBack [_magAction, [], _target];
} forEach _extraMagainzesNames;

_actions
