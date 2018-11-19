#include "script_component.hpp"
/*
 * Author: Garth de Wet (LH), PabstMirror, mharis001
 * Returns children actions for attachable items.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target, _player] call ace_attach_fnc_getChildrenActions
 *
 * Public: No
 */

params ["_target", "_player"];
TRACE_2("params",_target,_player);

private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgWeapons = configFile >> "CfgWeapons";

private _actions = [];

private _magazines = magazines _player;
{
    private _config = _cfgMagazines >> _x;
    if (getText (_config >> "ACE_Attachable") != "") then {
        private _displayName = getText (_config >> "displayName");
        private _picture = getText (_config >> "picture");
        private _action = [_x, _displayName, _picture, {[{_this call FUNC(attach)}, _this] call CBA_fnc_execNextFrame}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach (_magazines arrayIntersect _magazines);

{
    private _config = _cfgWeapons >> _x;
    if (getText (_config >> "ACE_Attachable") != "") then {
        private _displayName = getText (_config >> "displayName");
        private _picture = getText (_config >> "picture");
        private _action = [_x, _displayName, _picture, {[{_this call FUNC(attach)}, _this] call CBA_fnc_execNextFrame}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
        _actions pushBack [_action, [], _target];
    };
} forEach (_player call EFUNC(common,uniqueItems));

_actions
