/*
 * Author: jaynus
 * Master single PFH abstraction for all rounds being tracked by frag/spall.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_masterPFH
 *
 * Public: No
 */

//#define DEBUG_MODE_FULL
#include "script_component.hpp"

BEGIN_COUNTER(PFH);

// Fast exit if nothing to do
if (GVAR(objects) isEqualTo []) exitWith {END_COUNTER(PFH);};

private _gcIndex = [];

private _iter = 0;
private _objectCount = count GVAR(objects);
while {_objectCount > 0 && {_iter < (GVAR(maxTrackPerFrame) min _objectCount)}} do {

    if (GVAR(lastIterationIndex) >= _objectCount) then {
        GVAR(lastIterationIndex) = 0;
    };
    private _object = GVAR(objects) select GVAR(lastIterationIndex);

    if (!isNil "_object") then {
        private _args = GVAR(arguments) select GVAR(lastIterationIndex);

        if (!(_args call FUNC(pfhRound))) then {
            _gcIndex pushBack GVAR(lastIterationIndex); // Add it to the GC if it returns false
        };
    };
    INC(_iter);
    INC(GVAR(lastIterationIndex));
};

// Clean up dead object references
private _deletionCount = 0;
{
    TRACE_1("GC Projectile", _x);
    private _deleteIndex = _x - _deletionCount;
    GVAR(objects) deleteAt _deleteIndex;
    GVAR(arguments) deleteAt _deleteIndex;

    INC(_deletionCount);
} forEach _gcIndex;

END_COUNTER(PFH);
