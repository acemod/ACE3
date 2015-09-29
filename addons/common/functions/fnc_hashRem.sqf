/*
 * Author: ?
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
 */
#include "script_component.hpp"

private ["_val", "_index"];

params ["_hash", "_key"];

ERRORDATA(2);
_val = nil;
try {
    if(VALIDHASH(_hash)) then {
        _index = (_hash select 0) find _key;
        if(_index != -1) then {
            (_hash select 1) set[_index, "ACREHASHREMOVEDONOTUSETHISVAL"];
            // is this hash is not part of a hash list?
            // if it is we need to leave the keys intact.
            if((count _hash) == 2) then {
                // if this is a standalone hash then we can clean it up
                (_hash select 0) set[_index, "ACREHASHREMOVEDONOTUSETHISVAL"];
                _hash set[0, ((_hash select 0) - ["ACREHASHREMOVEDONOTUSETHISVAL"])];
                _hash set[1, ((_hash select 1) - ["ACREHASHREMOVEDONOTUSETHISVAL"])];
            };
        };
    } else {
        ERROR("Input hash is not valid");
    };
} catch {
    HANDLECATCH;
};
true
