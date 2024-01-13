#include "..\script_component.hpp"
/*
 * Author: JasperRab
 * Renames an object.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_cargo_fnc_renameObject
 *
 * Public: No
 */

private _display = uiNamespace getVariable QGVAR(menuDisplay);

if (isNil "_display") exitWith {};

private _ctrlEditText = ctrlText 100;
_ctrlEditText = _ctrlEditText select [0, 32];

// Check if custom name has been removed
if (_ctrlEditText isEqualTo "") then {
    [LSTRING(clearedCustomName), 3] call EFUNC(common,displayTextStructured);
} else {
    [[LSTRING(renamedObject), _ctrlEditText], 3] call EFUNC(common,displayTextStructured);
};

GVAR(interactionVehicle) setVariable [QGVAR(customName), _ctrlEditText, true];
