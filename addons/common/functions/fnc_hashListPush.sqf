//fnc_hashListPush.sqf
#include "script_component.hpp"

private ["_hashList", "_value"];

_hashList = _this select 0;
_value = _this select 1;
ERRORDATA(2);
try {
    if(VALIDHASH(_hashList)) then {
        [_hashList, (count (_hashList select 1)), _value] call FUNC(hashListSet);
    } else {
        ERROR("Input hashlist in push not valid");
    };
} catch {
    HANDLECATCH;
};
