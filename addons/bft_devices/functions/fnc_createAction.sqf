/*
 * Author: Glowbal
 * Create and add a new device action to the BFT action collection
 *
 * Arguments:
 * 0: Device Type <STRING>
 * 1: Localized display name of action <STRING>
 * 2: Icon Path <STRING> <OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["myDeviceType", "My Display name", "icon\path.paa"] call ace_bft_devices_fnc_createAction
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player", "_target", "_targetDeviceType", "_displayName", ["_icon", ""]];

if ([_player, _target, _targetDeviceType] call FUNC(canOpenDevice)) exitwith {
    private ["_condition", "_code", "_action"];

    _condition = compile format[QUOTE([ARR_3(_player,vehicle _target,'%1')] call FUNC(canOpenDevice)), _targetDeviceType];
    _code = compile format[QUOTE([ARR_3(_player,vehicle _target,'%1')] call FUNC(openDevice)), _targetDeviceType];

    _action = [format[QGVAR(device_%1),_targetDeviceType], _displayName, _icon, _code, _condition] call EFUNC(interact_menu,createAction);
    _action;
};
false;
