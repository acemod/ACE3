//fnc_hashListSet.sqf
#include "script_component.hpp"

private ["_hashList", "_index", "_value", "_vals"];

_hashList = _this select 0;
_index = _this select 1;
_value = _this select 2;
ERRORDATA(3);
try {
    if(VALIDHASH(_hashList)) then {
        if(VALIDHASH(_value)) then {
            _vals = _value select 1;

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
