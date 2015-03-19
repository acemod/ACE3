/*
 * Author: CAA-Picard
 * Collect a entire tree of active actions
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Original action tree <ARRAY>
 *
 * Return value:
 * Active children <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_object,_origAction);
EXPLODE_2_PVT(_origAction,_origActionData,_origActionChildren);

private ["_resultingAction","_target","_player","_activeChildren","_action","_actionData","_x"];

_target = _object;
_player = ACE_player;

// Return nothing if the action itself is not active
if !([_target, ACE_player, _origActionData select 9] call (_origActionData select 4)) exitWith {
    []
};

_activeChildren = [];

// If there's a statement to dynamically insert children then execute it
if (count _origActionData > 8 && {!({} isEqualTo (_origActionData select 8))}) then {
    _activeChildren = [_target, ACE_player, _origActionData select 9] call (_origActionData select 8);
};

// Collect children class actions
{
    _action = [_object, _x] call FUNC(collectActiveActionTree);
    if ((count _action) > 0) then {
        _activeChildren pushBack _action;
    };
} forEach _origActionChildren;

// Collect children object actions
{
    _action = _x;
    _actionData = _action select 0;

    // Check if the action is children of the original action
    if ((count (_actionData select 7)) == (count (_origActionData select 7) + 1)) then {

        // Compare parent path to see if it's a suitable child
        private "_isChild";
        _isChild = true;
        {
            if !(_x isEqualTo ((_actionData select 7) select _forEachIndex)) exitWith {
                _isChild = false;
            };
        } forEach (_origActionData select 7);

        if (_isChild) then {
            _action = [_object, _action] call FUNC(collectActiveActionTree);
            if ((count _action) > 0) then {
                _activeChildren pushBack _action;
            };
        };
    };
} forEach GVAR(objectActions);


// If the original action has no statement, and no children, don't display it
/*
if ((count _activeChildren) == 0 && ((_origActionData select 3) isEqualTo {})) exitWith {
    // @todo: Account for showDisabled?
    []
};
*/

//diag_log [_origActionData, _activeChildren, _object];
[_origActionData, _activeChildren, _object]
