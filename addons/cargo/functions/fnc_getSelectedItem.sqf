#include "..\script_component.hpp"
/*
 * Author: Glowbal, Smith
 * Get selected item from cargo menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Classname of selected item or selected object <STRING> or <OBJECT> (default: nil)
 *
 * Example:
 * call ace_cargo_fnc_getSelectedItem
 *
 * Public: No
 */

params [["_index", -1, [0]]];

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];

if (_loaded isEqualTo []) exitWith {};

// This can be an object or a classname string
_loaded param [_index, nil]
