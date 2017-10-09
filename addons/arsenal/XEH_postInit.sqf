#include "script_component.hpp"

GVAR(EH_ID) = 0;

[QGVAR(initBox), {
    TRACE_1("initBox EH", _this);

    if (isNull (_this select 0)) then {
        [] call CBA_fnc_removeGlobalEventJIP;
    } else {
        _this call FUNC(initBox);
    };
}] call CBA_fnc_addEventHandler;
[QGVAR(removeBox), {_this call FUNC(removeBox)}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastFace), {
    params ["_unit", "_face", "_ID"];
    TRACE_1("face EH", _this);

    if (isNull _unit) then {
        [_ID] call CBA_fnc_removeGlobalEventJIP;
    } else {
        _unit setFace _face;
    };
}] call CBA_fnc_addEventHandler;