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
 * [_player, _player, []] call ace_flashlights_fnc_compileShieldMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_player"];

private ["_action", "_actions", "_cfg", "_displayName", "_chemlights", "_icon", "_statement"];

_actions = [];
_chemlights = [_player] call FUNC(getShieldComponents);

//add all carried chemlight menus
{
    _cfg = (configFile >> "CfgMagazines" >> _x);
    _displayName = getText (_cfg >> "displayName");
    _icon = getText (_cfg >> "picture");
    
    _displayName = format ["Insert %1", _displayName];
    _shieldClass = getText (_cfg >> "ACE_ChemlightShieldType");

    _statement = {_this call FUNC(combineShield)};

    _action = [_x, _displayName, _icon, _statement, {true}, {}, [_x, _shieldClass]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _chemlights;

_actions