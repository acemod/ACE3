/*
 * Author: CAA-Picard
 * For a given action, collect all active children
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action data <ARRAY>
 *
 * Return value:
 * Active children <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_object,_parentAction);

private ["_activeChildren","_target","_player","_action"];

_activeChildren = [];

_target = _object;
_player = ACE_player;

// Collect children class actions
{
    _action = _x;

    if([_object, ACE_player] call (_action select 4)) then {
        _activeChildren pushBack _action;
    };
} forEach (_parentAction select 6);

// Collect children object actions
{
    _action = _x;

    // Check if the action is children of the selected menu
    if ((count (_action select 8)) == (count (_parentAction select 8) + 1)) then {

        // Compare parent path to see if it's a suitable child
        private "_isChild";
        _isChild = true;
        {
            if !(_x isEqualTo ((_action select 8) select _forEachIndex)) exitWith {
                _isChild = false;
            };
        } forEach (_parentAction select 8);

        if (_isChild) then {
            if ([_target, ACE_player] call (_action select 4)) then {
                _activeChildren pushBack _action;
            };
        };
    };
} forEach GVAR(objectActions);

_activeChildren
