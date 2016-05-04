/*
 * Author: Glowbal
 * Start unload action.
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Example:
 * [] call ace_cargo_fnc_startUnload
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

private _display = uiNamespace getVariable QGVAR(menuDisplay);
if (isNil "_display") exitWith {};

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
if (_loaded isEqualTo []) exitWith {};

private _ctrl = _display displayCtrl 100;

private _selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitWith {};
private _item = _loaded select _selected; //This can be an object or a classname string

// Start progress bar
if ([_item, GVAR(interactionVehicle), ACE_player] call FUNC(canUnloadItem)) then {
    private _size = [_item] call FUNC(getSizeItem);

    [
        5 * _size,
        [_item, GVAR(interactionVehicle), ACE_player],
        {["UnloadCargo", _this select 0] call EFUNC(common,localEvent)},
        {},
        localize LSTRING(UnloadingItem),
        {true},
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
} else {
    private _itemClass = if (_item isEqualType "") then {_item} else {typeOf _item};
    private _displayName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");

    ["displayTextStructured", [[LSTRING(UnloadingFailed), _displayName], 3.0]] call EFUNC(common,localEvent);
};
