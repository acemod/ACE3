//fnc_hashListCreateHash.sqf
#include "script_component.hpp"

private ["_hashKeys"];

PARAMS_1(_hashList);

ERRORDATA(1);
_hashKeys = [];
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
