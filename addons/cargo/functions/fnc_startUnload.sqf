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

private ["_display", "_loaded", "_ctrl", "_selected", "_item"];

disableSerialization;

_display = uiNamespace getVariable QGVAR(menuDisplay);
if (isNil "_display") exitWith {};

_loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
if (count _loaded == 0) exitWith {};

_ctrl = _display displayCtrl 100;

_selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitWith {};
_item = _loaded select _selected;


// Start progress bar
private ["_size", "_itemClass", "_displayName"];

if ([_item, GVAR(interactionVehicle)] call FUNC(canUnloadItem)) then {
    _size = [_item] call FUNC(getSizeItem);

    [5 * _size, [_item, GVAR(interactionVehicle)], "UnloadCargo", {}, localize LSTRING(UnloadingItem)] call EFUNC(common,progressBar);
} else {
    _itemClass = if (typeName _item == "STRING") then {_item} else {typeOf _item};
    _displayName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");

    ["displayTextStructured", [[LSTRING(UnloadingFailed), _displayName], 3.0]] call EFUNC(common,localEvent);
};
