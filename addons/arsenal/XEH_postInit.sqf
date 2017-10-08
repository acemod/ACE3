#include "script_component.hpp"

[QGVAR(initBox), {_this call FUNC(initBox)}] call CBA_fnc_addEventHandler;
[QGVAR(broadcastFace), {
    params ["_unit", "_face"];
    TRACE_2("face EH",_unit, _face);
    _unit setFace _face;
}] call CBA_fnc_addEventHandler;