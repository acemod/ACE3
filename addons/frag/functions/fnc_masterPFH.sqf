/*
 * Author: jaynus
 *
 * Master single PFH abstraction for all rounds being tracked by frag/spall
 *
 * Arguments:
 *
 *
 * Return Value:
 * None
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"
//PARAMS_2(_pfhArgs,_handle);

if (!GVAR(enabled)) exitWith {};

private["_gcIndex", "_iter"];
_gcIndex = [];

_iter = 0;
while { (count GVAR(objects)) > 0 &&  { _iter < (GVAR(MaxTrackPerFrame) min (count GVAR(objects))) } } do {
    private["_object", "_args"];
    if(GVAR(lastIterationIndex) >= (count GVAR(objects))) then {
        GVAR(lastIterationIndex) = 0;
    };
    _object = GVAR(objects) select GVAR(lastIterationIndex);

    if(!isNil "_object") then {
        _args = GVAR(arguments) select GVAR(lastIterationIndex);

        if(!(_args call FUNC(pfhRound))) then {
            _gcIndex pushBack GVAR(lastIterationIndex);    // Add it to the GC if it returns false
        };
    };
    _iter = _iter + 1;
    GVAR(lastIterationIndex) = GVAR(lastIterationIndex) + 1;
};

// clean up dead object references
private["_deletionCount", "_deleteIndex"];
_deletionCount = 0;
{
    TRACE_1("GC Projectile", _x);
    _deleteIndex = _x - _deletionCount;
    GVAR(objects) deleteAt _deleteIndex;
    GVAR(arguments) deleteAt _deleteIndex;

    _deletionCount = _deletionCount + 1;
} forEach _gcIndex;
