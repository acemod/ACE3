#include "script_component.hpp"
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

private _loadoutName = lbText [ID_LIST_LOADOUTS, lbCurSel ID_LIST_LOADOUTS];

lbDelete [ID_LIST_LOADOUTS, lbCurSel ID_LIST_LOADOUTS];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
private _index = {
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 3) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        _forEachIndex
    };
} forEach _aircraftLoadouts;
_aircraftLoadouts deleteAt _index;
profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
