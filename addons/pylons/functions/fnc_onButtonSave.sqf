#include "script_component.hpp"
/*
 * Author: 654wak654
 * Saves the selected pylon configuration to profileNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonSave
 *
 * Public: No
 */

private _loadoutName = ctrlText ID_EDIT_LOADOUTNAME;
private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
private _loadoutPylons = GVAR(comboBoxes) apply {(_x select 0) lbData (lbCurSel (_x select 0))};
private _turretOwners = GVAR(comboBoxes) apply {(_x select 2) getVariable [QGVAR(turret), [-1]]};

private _found = false;
{
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 2) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        _aircraftLoadouts set [_forEachIndex, [_loadoutName, _loadoutPylons, _turretOwners, typeOf GVAR(currentAircraft)]];
        _found = true;
    };
} forEach _aircraftLoadouts;

if (!_found) then {
    private _index = lbAdd [ID_LIST_LOADOUTS, _loadoutName];
    lbSetCurSel [ID_LIST_LOADOUTS, _index];
    _aircraftLoadouts pushBack [_loadoutName, _loadoutPylons, _turretOwners, typeOf GVAR(currentAircraft)];
};

profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
