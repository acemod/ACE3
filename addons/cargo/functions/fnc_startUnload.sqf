/*
 * Author: Glowbal
 * Start unload action
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display", "_loaded", "_ctrl", "_selected", "_item"];
disableSerialization;
_display = uiNamespace getvariable QGVAR(menuDisplay);
if (isnil "_display") exitwith {};

_loaded = GVAR(interactionVehicle) getvariable [QGVAR(loaded), []];
if (count _loaded == 0) exitwith {};

_ctrl = _display displayCtrl 100;

_selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitwith {};
_item = _loaded select _selected;

[_item, GVAR(interactionVehicle)] call FUNC(unloadItem);
