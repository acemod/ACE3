//fnc_hashListPush.sqf
#include "script_component.hpp"

PARAMS_2(_hashList,_value);

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
