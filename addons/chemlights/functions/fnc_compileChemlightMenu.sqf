#include "script_component.hpp"
/*
 * Author: voiper
 * Compile list of chemlight classnames and add to the "Chemlight shield" parent menu.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 2: Parameters <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _player, []] call ace_chemlights_fnc_compileChemlightMenu;
 *
 * Public: No
 */

params ["", "_player", "_args"];

private _actions = [];
private _chemlights = [_player] call FUNC(getShieldComponents);

//add all carried chemlight menus
{
    private _config = (configFile >> "CfgMagazines" >> _x);
    private _icon = getText (_config >> "picture");
    private _shieldClass = getText (_config >> "ACE_Chemlight_Shield");
    private _displayName = getText (configFile >> "CfgWeapons" >> _shieldClass >> "displayName");

    _displayName = format [localize LSTRING(Action_Prepare), _displayName];
    private _statement = {_this call FUNC(prepShield)};

    private _action = [_x, _displayName, _icon, _statement, {true}, {}, [_x, _shieldClass]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _chemlights;

_actions
