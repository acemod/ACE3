/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Updates spectator UI list of locations
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateListLocations
 *
 * Public: No
 */

#include "script_component.hpp"

private _newLocations = [];
private _newList = GVAR(locationsList);

// Whether an update to the list is required (really only if something changed)
if !(GVAR(curList) isEqualTo _newList) then {
    private _ctrl = CTRL_LIST;

    // Remove locations that are no longer there
    for "_locationIndex" from ((_ctrl tvCount []) - 1) to 0 step -1 do {
        private _lookup = _newLocations find (_ctrl tvData [_locationIndex]);
        if (_lookup < 0) then {
            _ctrl tvDelete [_locationIndex];
        } else {
            _newLocations deleteAt _lookup;
        };
    };

    // Hash location lookups, note hashing assumes unique location data
    private _locationDataToPathHash = [[], []];

    for "_locationIndex" from 0 to ((_ctrl tvCount []) - 1) do {
        (_locationDataToPathHash select 0) pushBack (_ctrl tvData [_locationIndex]);
        (_locationDataToPathHash select 1) pushBack [_locationIndex];
    };

    {
        _x params ["_id", "_name", "_description", "_texture"];

        private _lookup = (_locationDataToPathHash select 0) find _id;
        if (_lookup < 0) then {
            private _locationIndex = _ctrl tvAdd [[], _name];
            _ctrl tvSetData [[_locationIndex], _id];
            _ctrl tvSetPicture [[_locationIndex], _texture];
            _ctrl tvSetPictureColor [[_locationIndex], [1,1,1,1]];
            _ctrl tvSetTooltip [[_locationIndex], _description];
        } else {
            // pop data out of hash to improve later lookups
            (_locationDataToPathHash select 0) deleteAt _lookup;
            private _path = (_locationDataToPathHash select 1) deleteAt _lookup;

            _ctrl tvSetText [_path, _name];
            _ctrl tvSetPicture [_path, _texture];
            _ctrl tvSetPictureColor [_path, [1,1,1,1]];
            _ctrl tvSetTooltip [_path, _description];
        };

        nil // Speed loop
    } count _newList;

    GVAR(curList) = _newList;
};
