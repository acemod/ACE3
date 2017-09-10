/*
 * Author: 654wak654
 * Deletes the selected pylon configuration from profileNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonDelete
 *
 * Public: No
 */
#include "script_component.hpp"

private _loadoutName = lbText [160, lbCurSel 160];

lbDelete [160, lbCurSel 160];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
private _index = {
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 2) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        _forEachIndex
    };
} forEach _aircraftLoadouts;
_aircraftLoadouts deleteAt _index;
profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
