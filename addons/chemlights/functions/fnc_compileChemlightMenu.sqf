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

params ["", "_player"];

private ["_action", "_actions", "_cfg", "_displayName", "_chemlights", "_icon", "_statement", "_shieldClass", "_chemlightClass"];

_actions = [];
_chemlights = [_player] call FUNC(getShieldComponents);
_shields = [_player] call FUNC(getShields);

//add all carried chemlight menus
{
    _cfg = (configFile >> "CfgMagazines" >> _x);
    _icon = getText (_cfg >> "picture");
    _shieldClass = getText (_cfg >> "ACE_ChemlightShieldType");
    _displayName = getText (configFile >> "CfgWeapons" >> _shieldClass >> "displayName");
    
    _displayName = format [localize LSTRING(Action_Prepare), _displayName];
    _statement = {_this call FUNC(assembleShield)};

    _action = [_x, _displayName, _icon, _statement, {true}, {}, [_x, _shieldClass]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _chemlights;

//add all carried shield menus
{
    _cfg = (configFile >> "CfgWeapons" >> _x);
    _displayName = getText (_cfg >> "displayName");
    _icon = getText (_cfg >> "picture");
    _chemlightClass = getText (_cfg >> "ACE_Chemlight");
    
    _displayName = format [localize LSTRING(Action_Disassemble), _displayName];
    _statement = {_this call FUNC(disassembleShield)};

    _action = [_x, _displayName, _icon, _statement, {true}, {}, [_x, _chemlightClass]] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _shields;

_actions