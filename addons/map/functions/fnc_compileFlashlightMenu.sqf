/*
 * Author: voiper
 * Compile list of flashlight classnames and add to the "Flashlight" parent menu.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _player, []] call ace_map_fnc_compileFlashlightMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_player"];

private _actions = [];
private _flashlightItems = [_player] call FUNC(getUnitFlashlights);
private _unitLight = _player getVariable [QGVAR(flashlight), ["", objNull]];
_unitLight params ["_flashlight", ""];

//add all carried flashlight menus and on/off submenu actions
{
    private _cfg = (configFile >> "CfgWeapons" >> _x);
    private _displayName = getText (_cfg >> "displayName");
    private _icon = getText (_cfg >> "picture");

    private _statement = if (_flashlight == _x) then {
        _displayName = format [localize LSTRING(turnLightOff), _displayName];
        {[_player, ""] call FUNC(switchFlashlight)}
    } else {
        _displayName = format [localize LSTRING(turnLightOn), _displayName];
        {[_player, _this select 2] call FUNC(switchFlashlight)}
    };

    private _action = [_x, _displayName, _icon, _statement, {true}, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _player];
} forEach _flashlightItems;

_actions
