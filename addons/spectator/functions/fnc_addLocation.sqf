/*
 * Author: Nelson Duarte, SilentSpike
 * Add a location that can be seen in spectator view. Local effect.
 *
 * Arguments:
 * 0: Position <ARRAY or OBJECT>
 * 1: Display Name <STRING> (Default: "")
 * 2: Description <STRING> (Default: "")
 * 3: Texture <STRING> (Default: "")
 * 4: Camera Offset Vector <Array> (Default: [0,0,0])
 *
 * Notes:
 * - Position array is of form ATL
 * - Position objects will remove location upon objNull
 * - If an empty name is supplied, a descriptive name will be used
 * - Camera offset is used when teleporting to location, default is treated as random
 *
 * Return Value:
 * Unique ID (used to remove a location) <STRING>
 *
 * Example:
 * [[2000, 3202, 0], "Objective Alpha"] call ace_spectator_fnc_addLocation
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_pos",[],[[],objNull],3],
    ["_name","",[""]],
    ["_description","",[""]],
    ["_texture","",[""]],
    ["_offset",[0,0,0],[[]],3]
];

private _id = "";

if (_pos isEqualTo []) then {
    WARNING("Invalid position supplied");
} else {
    // Get a unique ID
    INC(GVAR(locationCount));
    _id = [QGVAR(id),GVAR(locationCount)] joinString "";

    // Must have a name to display in the list
    if (_name == "") then {
        if (_pos isEqualType objNull) then {
            _name = [_pos] call EFUNC(common,getName);
        } else {
            _name = _pos call BIS_fnc_locationDescription;
        };
    };

    // AGL is used for rendering purposes, but it makes sense for public function to take ATL
    if (_pos isEqualType []) then {
        _pos = ASLtoAGL ATLtoASL _pos;
    };

    // When no texture, just use a transparent procedural
    if (_texture == "") then { _texture = "#(rgb,8,8,3)color(0,0,0,0)"; };

    GVAR(locationsList) pushBack [_id, _name, _description, _texture, _pos, _offset];

    // Update the list if appropriate
    if !(isNull SPEC_DISPLAY) then {
        if (GVAR(uiListType) == LIST_LOCATIONS) then {
            [] call FUNC(ui_updateListLocations);
        };
    };
};

_id
