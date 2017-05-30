/*
 * Author: SzwedzikPL
 * Creates one action per dogtag.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * _childrenActions = [unit, player] call ace_dogtags_fnc_addDogtagActions
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player"];

//Get all dogtags and their ids
private _unitDogtags = [];
private _unitDogtagIDs = [];
{
    private _id = getNumber (configFile >> "CfgWeapons" >> _x >> QGVAR(tagID));
    if (_id > 0) then {
        _unitDogtags pushBack _x;
        _unitDogtagIDs pushBack _id;
    };
} forEach items _player;

//Create action children for all dogtags
private _actions = [];
{
    private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    private _picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");

    private _action = [_x, _displayName, _picture, {_this call FUNC(checkDogtagItem)}, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _unitDogtags;

_actions
