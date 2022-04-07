#include "script_component.hpp"
/*
 * Author: JasperRab
 * Renames object.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_cargo_fnc_renameObject
 *
 * Public: Yes
 */

private _display = uiNamespace getVariable QGVAR(menuDisplay);
if (isNil "_display") exitWith {};

private _ctrlEditText = ctrlText 100;
if (_ctrlEditText isEqualTo "") then { // custom name has been removed
    [LSTRING(clearedCustomName), 3] call EFUNC(common,displayTextStructured);
} else {
    [[LSTRING(renamedObject), _ctrlEditText], 3] call EFUNC(common,displayTextStructured);
};
GVAR(interactionVehicle) setVariable [QGVAR(customName), _ctrlEditText, true];
