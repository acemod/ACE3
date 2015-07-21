/*
 * Author: BaerMitUmlaut
 * Handles tag destruction when the object they are attached to gets destroyed.
 *
 * Arguments:
 * None
 * 
 * Return Value:
 * 0: The tag that should get destroyed <OBJECT>
 * 1: The object the tag is attached to <OBJECT>
 *
 * Example:
 * [tag, object] call ace_tagging_fnc_handleTagDestruction
 *
 * Public: No
 */


#include "script_component.hpp"
private ["_tag", "_attachedTags", "_object"];

PARAMS_2(_tag,_object);

if (count (_object getVariable [QGVAR(attachedTags), []]) == 0) then {
    _object setVariable [QGVAR(attachedTags), [_tag]];
    _object addEventHandler ["HandleDamage", {
        if ((_this select 1) == "" && (_this select 2) >= 1) then {
            {
                deleteVehicle _x;
            } foreach ((_this select 0) getVariable ["ace_tagging_attachedTags", []]);
            (_this select 0) setVariable ["ace_tagging_attachedTags", []];
        };
    }];
} else {
    _attachedTags = _object getVariable [QGVAR(attachedTags), []];
    _attachedTags pushBack _tag;
    _object setVariable [QGVAR(attachedTags), _attachedTags];
};