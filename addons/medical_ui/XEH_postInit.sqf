#include "script_component.hpp"

if (!hasInterface) exitWith {};

[] call FUNC(initEffects);
[FUNC(handleEffects),   1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(effectHeartBeat), 0, []] call CBA_fnc_addPerFrameHandler;

["ace_unconscious", {
    params ["_unit", "_unconscious"];
    if (_unit != ACE_player) exitWith {};

    [_unconscious, 1] call FUNC(effectUnconscious);
    ["unconscious", _unconscious] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addEventHandler;
