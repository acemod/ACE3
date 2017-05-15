/*
 * Author: Nelson Duarte, SilentSpike
 * Updates spectator UI list of locations
 *
 * Public: No
 */

#include "script_component.hpp"

// Temporarily do nothing
if true exitWith {};

private _newList = [];

// <Get new list here>

// Whether an update to the list is required (really only if something changed)
if !(GVAR(curList) isEqualTo _newList) then {
    private _allLocations = [];

    private _ctrl = CTRL_LIST;
    for "_i" from 0 to ((_ctrl tvCount []) - 1) do
    {
        _allLocations pushBack (_ctrl tvData [_i]);
    };

    {
        private ["_id", "_object", "_name", "_description", "_texture", "_cameraOffset"];
        _id         = _x select 0;
        _name       = _x select 1;
        _description    = _x select 2;
        _texture    = _x select 3;
        _cameraOffset   = _x select 4;

        _allLocations = _allLocations - [_id];

        private _i = ["TreeGetDataIndex", [_id]] call FUNC(display);

        if (_i isEqualTo []) then
        {
            _ctrl tvAdd [[], _name];
            _ctrl tvSetData [[_forEachIndex], _id];
            _ctrl tvSetPicture [[_forEachIndex], _texture];
            _ctrl tvSetPictureColor [[_forEachIndex], [1,1,1,1]];
            _ctrl tvSetTooltip [[_forEachIndex], _name];
        }
        else
        {
            _ctrl tvSetText [_i, _name];
            _ctrl tvSetPicture [_i, _texture];
            _ctrl tvSetPictureColor [_i, [1,1,1,1]];
            _ctrl tvSetTooltip [_i, _name];
        };
    } forEach _newList;

    // Delete all elements that are now gone
    { ["TreeDeleteItem", [_x]] call FUNC(display); } forEach _allLocations;

    GVAR(curList) = _newList;
};
