
#include "script_component.hpp"

GVAR(heartBeatSounds_Fast) = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3"];
GVAR(heartBeatSounds_Normal) = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Slow) = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2"];

call FUNC(stateMachine);

//Handle Deleting Bodies and creating litter on Server:
if (isServer) then {
    ["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;
};

["ace_unconscious", {
    params ["_unit", "_status"];

    if (local _unit) then {
        if (_status) then {
            _unit setVariable ["tf_voiceVolume", 0, true];
            _unit setVariable ["tf_unable_to_use_radio", true, true];
            _unit setVariable ["acre_sys_core_isDisabled", true, true];
        } else {
            _unit setVariable ["tf_voiceVolume", 1, true];
            _unit setVariable ["tf_unable_to_use_radio", false, true];
            _unit setVariable ["acre_sys_core_isDisabled", false, true];
        };
    };
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    private _pain = ACE_player getVariable [QGVAR(pain), 0];

    linearConversion [0, 1, _pain, 1, 5, true];
}] call EFUNC(common,arithmeticSetSource);
