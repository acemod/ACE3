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
// diag_log text format["%1 HASH HAS KEY: %2", ACE_diagTime, _this];

params ["_hash", "_key"];

ERRORDATA(2);
_val = false;
try {
    if(VALIDHASH(_hash)) then {
        _index = (_hash select 0) find _key;
        if(_index != -1) then {
            _val = true;
        };
    } else {
        ERROR("Input hash is not valid");
    };
} catch {
    HANDLECATCH;
};
_val
