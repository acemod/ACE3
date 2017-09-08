#include "script_component.hpp"

[QGVAR(disableAI), {
    params [["_units", [], [[]]], "_section"];
    {_x disableAI _section} foreach (_units select {local _x});
}] call CBA_fnc_addEventHandler;

[QGVAR(unGarrison), FUNC(unGarrison)] call CBA_fnc_addEventHandler;
