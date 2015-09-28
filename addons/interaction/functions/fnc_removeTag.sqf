/*
 * Author: commy2
 * Removes tag
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_removeTag
 *
 * Public: No
 */
#include "script_component.hpp"

0 spawn {
    private ["_index", "_name"];

    waitUntil {player getVariable ["ACE_Name", ""] != ""};

    _name = player getVariable ["ACE_Name", ""];
    _name = toArray _name;

    _index = _name find (toArray "]" select 0);

    if (_index != -1) then {
        for "_index" from 0 to _index do {
            _name set [_index, -1];
        };
        _name = _name - [-1];
        _name = toString _name;
        player setVariable ["ACE_Name", _name, true];
    };
};
