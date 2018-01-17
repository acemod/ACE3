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

ACE_DEPRECATED(QFUNC(hashGet),"3.8.0","CBA_fnc_hashGet");

params ["_hash", "_key"];

ERRORDATA(2);
private _val = nil;
try {
    if(VALIDHASH(_hash)) then {
        private _index = (_hash select 0) find _key;
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
