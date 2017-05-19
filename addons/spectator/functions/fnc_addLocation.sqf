/*
 * Author: Nelson Duarte, SilentSpike
 * Add a location that can be seen in spectator view
 *
 * Notes:
 * - If an empty name is supplied, a descriptive name will be used
 * - Locations that are objects will be removed upon objNull
 * - Texture can be procedural (e.g. "#(rgb,8,8,3)color(1,1,1,1)")
 *   https://community.bistudio.com/wiki/Procedural_Textures
 *
 * Arguments:
 * 0: Position <ARRAY or OBJECT>
 * 1: Radius <NUMBER> (Default: 50)
 * 2: Display Name <STRING> (Default: "")
 * 3: Description <STRING> (Default: "")
 * 4: Texture <STRING> (Default: "")
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
    ["_radius",50,[0]],
    ["_name","",[""]],
    ["_description","",[""]],
    ["_texture","",[""]]
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
            _name = [_pos,false,false] call EFUNC(common,getName);
        } else {
            // TODO: This function complains?
            _name = [_pos] call BIS_fnc_locationDescription;
        };
    };

    // Must have a texture to draw
    if (_texture == "") then { _texture = "#(rgb,8,8,3)color(0,0,0,0)"; };

    GVAR(locationsList) pushBack [_id, _name, _description, _texture, _pos, _radius];
};

_id
