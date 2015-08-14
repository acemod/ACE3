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

private ["_display", "_loaded", "_loadedCount", "_ctrl", "_selected", "_item"];
disableSerialization;
_display = uiNamespace getvariable QGVAR(menuDisplay);
if (isnil "_display") exitwith {};

_loaded = GVAR(interactionVehicle) getvariable [QGVAR(loaded), []];
_loadedCount = count _loaded;
if (_loadedCount == 0) exitwith {};

_ctrl = _display displayCtrl 100;

_selected = (lbCurSel _ctrl) max 0;

if (_loadedCount <= _selected) exitwith {systemChat format["count: %1 %2", _loadedCount, _selected]};
_item = _loaded select _selected;

[_item, GVAR(interactionVehicle)] call FUNC(unloadItem);
