#include "script_component.hpp"

GVAR(EH_ID) = 0;

[QGVAR(initBox), {_this call FUNC(initBox)}] call CBA_fnc_addEventHandler;
[QGVAR(removeBox), {_this call FUNC(removeBox)}] call CBA_fnc_addEventHandler;

[QGVAR(broadcastFace), {
    params ["_unit", "_face"];

    _unit setFace _face;
}] call CBA_fnc_addEventHandler;
[QGVAR(broadcastVoice), {
    params ["_unit", "_voice"];

    _unit setSpeaker _voice;
}] call CBA_fnc_addEventHandler;