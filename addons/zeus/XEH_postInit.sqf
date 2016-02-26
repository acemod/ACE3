#include "script_component.hpp"

["UpdateAISettings", {
    TRACE_1("UpdateAISettings EH",_this);
    {
        if (local _x) then {
            [_x] call FUNC(setSkillsLocal);
        };
    } forEach allUnits;
}] call EFUNC(common,addEventHandler);
