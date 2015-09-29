/*
 * Author: ?
 * Returns value attached to key in given hash.
 *
 * Arguments:
 * 0: Hash <ARRAY>
 * 1: Key <STRING>
 *
 * Return Value:
 * Value <ANY>
 *
 * Public: No
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
            _val = (_hash select 1) select _index;
            if(IS_STRING(_val) && {_val == "ACREHASHREMOVEDONOTUSETHISVAL"}) then {
                _val = nil;
            };
        };
    } else {
        ERROR("Input hash is not valid");
    };
} catch {
    HANDLECATCH;
};

if (isNil "_val") exitWith { nil };

_val
