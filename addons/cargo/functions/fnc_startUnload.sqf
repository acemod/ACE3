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
if (isnil "_display") exitWith {};

_loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
if (count _loaded == 0) exitWith {};

_ctrl = _display displayCtrl 100;

_selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitWith {};
_item = _loaded select _selected;

[_item, GVAR(interactionVehicle), ACE_player] call FUNC(unloadItem);
