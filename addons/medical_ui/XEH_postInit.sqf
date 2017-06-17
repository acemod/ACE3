#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(nextFadeIn) = 0;
GVAR(heartBeatEffectRunning) = false;

[false] call FUNC(initEffects);
[LINKFUNC(handleEffects), 1, []] call CBA_fnc_addPerFrameHandler;

["ace_unconscious", {
    params ["_unit", "_unconscious"];
    if (_unit != ACE_player) exitWith {};

    [_unconscious, 1] call FUNC(effectUnconscious);
    ["unconscious", _unconscious] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addEventHandler;

["unit", {
    params ["_new", "_old"];
    private _status = _new getVariable ["ace_unconscious", false];
    [_status, 0] call FUNC(effectUnconscious);
    ["unconscious", _status] call EFUNC(common,setDisableUserInputStatus);
}] call CBA_fnc_addPlayerEventHandler;
