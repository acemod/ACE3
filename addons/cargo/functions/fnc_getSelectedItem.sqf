#include "script_component.hpp"
/*
 * Author: Glowbal (moved to separate function by Smith)
 * Get selected item from cargo menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Classname or object of selected item <OBJECT or STRING> (default: nil)
 *
 * Example:
 * [] call ace_cargo_fnc_getSelectedItem
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable QGVAR(menuDisplay);
if (isNil "_display") exitWith {};

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
if (_loaded isEqualTo []) exitWith {};

private _ctrl = _display displayCtrl 100;

private _selected = (lbCurSel _ctrl) max 0;

if (count _loaded <= _selected) exitWith {};

_loaded select _selected
