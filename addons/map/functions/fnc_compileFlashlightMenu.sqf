/*
 * Author: voiper
 * Compile list of flashlight classnames and add to the "Flashlight" parent menu.
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
 * [_player, _player, []] call ace_map_fnc_compileFlashlightMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_player"];

private["_action", "_actions", "_cfg", "_displayName", "_flashlights", "_icon", "_statement"];

_actions = [];
_flashlights = [_player] call FUNC(getUnitFlashlights);

//add all carried flashlight menus and on/off submenu actions
{
    _cfg = (configFile >> "CfgWeapons" >> _x);
    _displayName = getText (_cfg >> "displayName");
    _icon = getText (_cfg >> "picture");
    
    _statement = if (GVAR(flashlightInUse) == _x) then {
        _displayName = format [localize LSTRING(turnLightOff), _displayName];
        {[""] call FUNC(switchFlashlight)}
    } else {
        _displayName = format [localize LSTRING(turnLightOn), _displayName];
        {[_this select 2] call FUNC(switchFlashlight)}
    };

    _action = [_x, _displayName, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _flashlights;

_actions
