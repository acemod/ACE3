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

params ["_hashList", "_index", "_value"];

ERRORDATA(3);
try {
    if(VALIDHASH(_hashList)) then {
        if(VALIDHASH(_value)) then {
            private _vals = _value select 1;

            (_hashList select 1) set[_index, _vals];
        } else {
            ERROR("Set hash in hashlist is not valid");
        };
    } else {
        ERROR("Input hashlist is not valid");
    };
} catch {
    HANDLECATCH;
};
