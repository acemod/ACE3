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
#include "script_component.hpp"
PARAMS_2(_pfhArgs,_handle);

if (!GVAR(enabled)) exitWith {};

private["_gcIndex"];
_gcIndex = [];
{
    private["_object", "_args"];
    _object = _x;
    if(!isNil "_object") then {
        if(isNull _object) then {
            _gcIndex pushBack _forEachIndex;
        } else {
            _args = GVAR(arguments) select _forEachIndex;
            
            _args call FUNC(pfhRound);
        };
        
        if(!alive _object) then {
            _gcIndex pushBack _forEachIndex;
        };
    };
} forEach GVAR(objects);

// clean up dead object references
private["_deletionCount", "_deleteIndex"];
_deletionCount = 0;
{
    _deleteIndex = _gcIndex - _deletionCount;
    GVAR(objects) deleteAt _deleteIndex;
    GVAR(arguments) deleteAt _deleteIndex;
    
    _deletionCount = _deletionCount + 1;
} forEach _gcIndex;