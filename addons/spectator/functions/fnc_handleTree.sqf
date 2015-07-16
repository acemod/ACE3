/*
 * Author: SilentSpike
 * Tracks the units in the unit tree and updates it according to their status
 *
 * Arguments:
 * None <NIL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [] call ace_spectator_fnc_handleTree;
 *
 * Public: No
 */

#include "script_component.hpp"

// Remove any existing PFH
if !(isNil QGVAR(treePFH)) then {
    [GVAR(treePFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(treePFH) = nil;
};

// Fetch tree
disableSerialization;
_display = GETUVAR(GVAR(display),displayNull);
_ctrl = _display displayCtrl IDC_TREE;

// Cache current selection
_curSelData = _ctrl tvData (tvCurSel _ctrl);

// Clear the tree
tvClear _ctrl;

// Update the tree
_cachedGrps = [];
{
    _grp = group _x;
    _node = 0;
    // If group already exists, find existing node
    if !(_grp in _cachedGrps) then {
        _side = [west,east,resistance,civilian,sideLogic] find (side _grp);
        _node = _ctrl tvCount [];

        _ctrl tvAdd [[], groupID _grp];
        _ctrl tvSetValue [[_node], _side];

        _cachedGrps pushBack _grp;
    } else {
        _node = _cachedGrps find _grp;
    };

    _index = _ctrl tvCount [_node];

    _ctrl tvAdd [[_node], name _x];
    _ctrl tvSetData [[_node,_index], netID _x];

    // Preserve the previous selection
    if (_curSelData == (_ctrl tvData [_node,_index])) then {
        _ctrl tvSetCurSel [_node,_index];
    };

    _ctrl tvSort [[_node],false];
} forEach GVAR(unitList);

// Sort group nodes by side
_ctrl tvSortByValue [[],false];

// Keep tree up to date
GVAR(treePFH) = [{
    // Kill PFH when display is closed
    if (isNull (GETUVAR(GVAR(display),displayNull))) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        GVAR(treePFH) = nil;
    };

    disableSerialization;
    _display = GETUVAR(GVAR(display),displayNull);
    _ctrl = _display displayCtrl IDC_TREE;

    _nodes = (_ctrl tvCount []) - 1;
    for "_n" from 0 to _nodes do {
        _units = (_ctrl tvCount [_n]) - 1;
        for "_i" from 0 to _units do {
            _netID = _ctrl tvData [_n,_i];
            _unit = objectFromNetId _netID;

            if (isNull _unit || !alive _unit) then {
                _ctrl tvDelete [_n,_i];
                GVAR(unitList) = GVAR(unitList) - [_unit];
            };
        };
    };
}, 5] call CBA_fnc_addPerFrameHandler;
