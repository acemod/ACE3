/*
 * Author: BaerMitUmlaut
 * Checks if the unit can cut deployed ropes.
 *
 * Arguments:
 * 0: The helicopter itself <OBJECT>
 *
 * Return Value:
 * Able to cut ropes <BOOL>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_canCutRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];

private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];

!(_deployedRopes isEqualTo []) &&
{{(_x select 5)} count (_deployedRopes) == 0}
