#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(nextFadeIn) = 0;
GVAR(heartBeatEffectRunning) = false;

[false] call FUNC(initEffects);
[LINKFUNC(handleEffects), 1, []] call CBA_fnc_addPerFrameHandler;

["ace_unconscious", {
    params ["_unit", "_unconscious"];

    if (local _unit) then {
        _unit setVariable ["tf_voiceVolume", [1, 0] select _unconscious, true];
        _unit setVariable ["tf_unable_to_use_radio", _unconscious, true];
        _unit setVariable ["acre_sys_core_isDisabled", _unconscious, true];
    };

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
