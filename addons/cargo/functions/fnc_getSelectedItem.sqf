#include "..\script_component.hpp"
/*
 * Author: Glowbal, Smith
 * Get selected item from cargo menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Classname of selected item or selected object <STRING or OBJECT or NIL> (default: nil)
 *
 * Example:
 * call ace_cargo_fnc_getSelectedItem
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable QGVAR(menuDisplay);

if (isNil "_display") exitWith {};

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];

if (_loaded isEqualTo []) exitWith {};

// This can be an object or a classname string
_loaded param [lbCurSel (_display displayCtrl 100), nil]
