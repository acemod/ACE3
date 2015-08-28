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

params ["_vehicle", "_player", "_parameters"];

_actions = [];
_flashlights = [_player] call FUNC(getUnitFlashlights);

//add all carried flashlight menus and on/off submenu actions
{
    _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
    _icon = getText (configFile >> "CfgWeapons" >> _x >> "picture");

    _children = {
        params ["_vehicle", "_player", "_flashlight"];
        _actions = [];

        _onAction = [
            (_flashlight + "_On"),
            "On",
            "",
            {[_this select 2] call FUNC(switchFlashlight)},
            {GVAR(flashlightInUse) != (_this select 2)},
            {},
            _flashlight
        ] call EFUNC(interact_menu,createAction);

        _offAction = [
            (_flashlight + "_Off"),
            "Off",
            "",
            {[""] call FUNC(switchFlashlight)},
            {GVAR(flashlightInUse) == (_this select 2)},
            {},
            _flashlight
        ] call EFUNC(interact_menu,createAction);

        _actions pushBack [_onAction, [], _player];
        _actions pushBack [_offAction, [], _player];

        _actions
    };

    _parentAction = [_x, _displayName, _icon, {true}, {true}, _children, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_parentAction, [], _player];
} forEach _flashlights;

_actions