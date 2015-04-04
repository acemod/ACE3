/*
 * Author: PabstMirror
 * Show the ammo counts for a static weapon.
 * Called from "insertChildren" on interact_menu
 *
 * Argument:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return value:
 * ChildActiosn<ARRAY>
 *
 * Example:
 * [mortar, player] call ace_reload_fnc_checkAmmoHover
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_magainzesNames", "_magainzesCounts", "_index", "_actions", "_ammoCount", "_display", "_magAction"];

PARAMS_2(_target,_player);

//For self interaction, get the player's vehicle
if (_player == _target) then {
    _target = vehicle _player;
};

//Get counts for each ammo types (merged if they have the same displaynameshort)
_magainzesNames = [];
_magainzesCounts = [];
{
    EXPLODE_5_PVT(_x,_xClassName,_xAmmo,_xState,_xType,_xLocation);
    _name = getText (configFile >> "CfgMagazines" >> _xClassName >> "displaynameshort");
    _index = _magainzesNames find _name;
    if (_index == -1) then {
        _magainzesNames pushBack _name;
        _magainzesCounts pushBack _xAmmo;
    } else {
        _magainzesCounts set [_index, ((_magainzesCounts select _index) + _xAmmo)];
    };
} forEach (magazinesAmmoFull _target);

_actions = [];
{
    _ammoCount = _magainzesCounts select _forEachIndex;
    if (_ammoCount > 30) then {
        if (_ammoCount < 250) then {
            //above 30, give a rough estimate
            _ammoCount = 10 * floor (_ammoCount / 10);
        } else {
            //above 250, give a more rough estimate
            _ammoCount = 50 * floor (_ammoCount / 50);
        };
    };
    _display = format ["%1x<br/>%2", _ammoCount, _x];
    
    //Need a dummy statement or it doesn't show
    _magAction = [_x, _display, "", {private "_nul"; _nul = 0;}, {true}, {}] call EFUNC(interact_menu,createAction);
    _actions pushBack [_magAction, [], _target];
} forEach _magainzesNames;

_actions
