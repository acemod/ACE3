#include "script_component.hpp"
/*
 * Author: PabstMirror, commy2, esteldunedain, Ruthberg
 * Gets magazine children for interaciton menu.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * ChildActions <ARRAY>
 *
 * Example:
 * [player, player] call ace_magazinerepack_fnc_getMagazineChildren
 *
 * Public: No
 */

params ["_target", "_player"];

// get all mags and ammo count
private _unitMagazines = [];
private _unitMagCounts = [];
{
    _x params ["_xClassname", "_xCount", "_xLoaded", "_xType"];

    private _xFullMagazineCount = getNumber (configFile >> "CfgMagazines" >> _xClassname >> "count");

    //for every partial magazine, that is either in inventory or can be moved there
    if ((_xCount < _xFullMagazineCount) && {_xCount > 0} && {(!_xLoaded) || {GVAR(repackLoadedMagazines) && {[_player, _xClassname] call CBA_fnc_canAddItem}}}) then {
        private _index = _unitMagazines find _xClassname;
        if (_index == -1) then {
            _unitMagazines pushBack _xClassname;
            _unitMagCounts pushBack [_xCount];
        } else {
            (_unitMagCounts select _index) pushBack _xCount;
        };
    };
} forEach (magazinesAmmoFull _player);

//Create the action children for all appropriate magazines
private _actions = [];
{
    if ((count (_unitMagCounts select _forEachIndex)) >= 2) then {// Ignore invalid magazines types (need 2+ partial mags to do anything)
        private _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        private _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");

        private _action = [_x, _displayName, _picture, {_this call FUNC(startRepackingMagazine)}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _player];
    };
} forEach _unitMagazines;

_actions
