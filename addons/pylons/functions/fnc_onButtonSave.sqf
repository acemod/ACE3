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
#include "script_component.hpp"

private _loadoutName = ctrlText 170;
private _loadoutPylons = [];
{
    _loadoutPylons pushBack ((_x select 0) lbData (lbCurSel (_x select 0)));
} forEach GVAR(comboBoxes);

private _index = lbAdd [160, _loadoutName];
lbSetCurSel [160, _index];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
private _found = {
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 2) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        _aircraftLoadouts set [_forEachIndex, [_loadoutName, _loadoutPylons, typeOf GVAR(currentAircraft)]];
        true
    };
    false
} forEach _aircraftLoadouts;

if (!_found) then {
    _aircraftLoadouts pushBack [_loadoutName, _loadoutPylons, typeOf GVAR(currentAircraft)];
};

profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
