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

ACE_DEPRECATED(QFUNC(hashSet),"3.8.0","CBA_fnc_hashSet");

// diag_log text format["%1 HASH SET: %2", diag_tickTime, _this];

params ["_hash", "_key", "_val"];

ERRORDATA(3);
try {
    if(VALIDHASH(_hash)) then {
        private _index = (_hash select 0) find _key;
        if(_index == -1) then {
            _index = (_hash select 0) find "ACREHASHREMOVEDONOTUSETHISVAL";
            if(_index == -1) then {
                _index = (count (_hash select 0));
            };
            (_hash select 0) set[_index, _key];
        };
        (_hash select 1) set[_index, _val];
    } else {
        ERROR("Input hash is not valid");
    };
} catch {
    HANDLECATCH;
};
