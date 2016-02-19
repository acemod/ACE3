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

params ["_hashList", "_index"];

ERRORDATA(2);
private _hash = nil;
try {
    if(VALIDHASH(_hashList)) then {
        _hashList params ["_keys", "_hashes"];

        if(_index < (count _hashes)) then {
            private _values = _hashes select _index;

            _hash = [_keys, _values, 1];
        } else {
            ERROR("Index of hashlist is out of range");
        };
    } else {
        ERROR("Input hashlist is not valid");
    };
} catch {
    HANDLECATCH;
};

if (isNil "_hash") exitWith { nil };
_hash;
