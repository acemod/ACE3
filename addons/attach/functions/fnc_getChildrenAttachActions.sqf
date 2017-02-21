/*
 * Author: Garth de Wet (LH), PabstMirror
 * Show the ammo counts for a static weapon.
 * Called from "insertChildren" on interact_menu
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * ChildActiosn<ARRAY>
 *
 * Example:
 * [player, player] call ace_attach_fnc_getChildrenAttachActions
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_listed", "_actions", "_item", "_displayName", "_picture", "_action"];
params ["_target","_player"];
TRACE_2("params",_target,_player);

_listed = [];
_actions = [];

{
    if !(_x in _listed) then {
        _listed pushBack _x;
        _item = ConfigFile >> "CfgMagazines" >> _x;
        if (getText (_item >> "ACE_Attachable") != "") then {
            _displayName = getText(_item >> "displayName");
            _picture = getText(_item >> "picture");
            _action = [_x, _displayName, _picture, {[{_this call FUNC(attach)}, _this] call CBA_fnc_execNextFrame}, {_this call FUNC(canAttach)}, {}, [_x]] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _target];
        };
    };
} forEach (magazines _player);

{
    if !(_x in _listed) then {
        _listed pushBack _x;
        _item = ConfigFile >> "CfgWeapons" >> _x;
        if (getText (_item >> "ACE_Attachable") != "") then {
            _displayName = getText(_item >> "displayName");
            _picture = getText(_item >> "picture");
            _action = [_x, _displayName, _picture, {[{_this call FUNC(attach)}, _this] call CBA_fnc_execNextFrame}, {_this call FUNC(canAttach)}, {}, [_x]] call EFUNC(interact_menu,createAction);
            _actions pushBack [_action, [], _target];
        };
    };
} forEach (items _player);

_actions
