/*
 * Author: 654wak654
 * Deletes the selected pylon configuration from profileNamespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_aircraft_fnc_onButtonDelete
 *
 * Public: No
 */
#include "script_component.hpp"

private _selection = lbText [160, lbCurSel 160];

lbDelete [160, lbCurSel 160];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
FILTER(_aircraftLoadouts,(_x select 0) != _selection);
profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
