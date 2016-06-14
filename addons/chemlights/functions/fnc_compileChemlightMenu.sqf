/*
 * Author: voiper
 * Compile list of chemlight classnames and add to the "Chemlight shield" parent menu.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [_player, _player, []] call ace_chemlights_fnc_compileChemlightMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_player", "_args"];
private ["_action", "_actions", "_config", "_displayName", "_chemlights", "_icon", "_statement", "_shieldClass"];

_actions = [];
_chemlights = [_player] call FUNC(getShieldComponents);

//add all carried chemlight menus
{
    _config = (configFile >> "CfgMagazines" >> _x);
    _icon = getText (_config >> "picture");
    _shieldClass = getText (_config >> "ACE_Chemlight_Shield");
    _displayName = getText (configFile >> "CfgWeapons" >> _shieldClass >> "displayName");
    
    _displayName = format [localize LSTRING(Action_Prepare), _displayName];
    _statement = {_this call FUNC(prepShield)};

    _action = [_x, _displayName, _icon, _statement, {true}, {}, [_x, _shieldClass]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _chemlights;

_actions
