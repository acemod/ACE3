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

params ["_hashList"];

ERRORDATA(1);
private _hashKeys = [];
try {
    if(VALIDHASH(_hashList)) then {
        _hashKeys = (_hashList select 0);
    } else {
        ERROR("Input hashlist is not valid");
    };
} catch {
    HANDLECATCH;
};
[_hashKeys, []];
