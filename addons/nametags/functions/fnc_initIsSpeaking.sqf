/*
 * Author: Glowbal, PabstMirror
 * Starts up a PFEH to monitor the when players are talking.
 * Compatiblity with TFR/ACRE and Arma's VON
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call ACE_nametags_fnc_initIsSpeaking
 *
 * Public: No
 */
#include "script_component.hpp"

if (isServer) then {
    //If someone disconnects while speaking, reset their variable
    addMissionEventHandler ["HandleDisconnect", {
        PARAMS_1(_disconnectedPlayer);
        if (_disconnectedPlayer getVariable [QGVAR(isSpeakingInGame), false]) then {
            _disconnectedPlayer setVariable [QGVAR(isSpeakingInGame), false, true];
        };
    }];
};

if (!hasInterface) exitWith {};

["playerChanged", {
    //When player changes, make sure to reset old unit's variable
    PARAMS_2(_newUnit,_oldUnit);
    if ((!isNull _oldUnit) && {_oldUnit getVariable [QGVAR(isSpeakingInGame), false]}) then {
        _oldUnit setVariable [QGVAR(isSpeakingInGame), false, true];
    };
}] call EFUNC(common,addEventHandler);


if (isClass (configFile >> "cfgPatches" >> "acre_api")) then {
    diag_log text format ["[ACE_nametags] - ACRE Detected"];
    DFUNC(isSpeaking) = {
        PARAMS_1(_unit);
        (([_unit] call acre_api_fnc_isSpeaking) || ([ACE_player] call acre_api_fnc_isBroadcasting)) && {!(_unit getVariable ["ACE_isUnconscious", false])}
    };
} else {
    if (isClass (configFile >> "cfgPatches" >> "task_force_radio")) then {
        diag_log text format ["[ACE_nametags] - TFR Detected"];
        DFUNC(isSpeaking) =     {
            PARAMS_1(_unit);
            (_unit getVariable ["tf_isSpeaking", false]) && {!(_unit getVariable ["ACE_isUnconscious", false])}
        };
    } else {
        //No Radio Mod - Start a PFEH to watch the internal VON icon
        //Note: class RscDisplayVoiceChat {idd = 55} - only present when talking

        [{
            private ["_oldSetting", "_newSetting"];
            _oldSetting = ACE_player getVariable [QGVAR(isSpeakingInGame), false];
            _newSetting = (!(isNull findDisplay 55));
            if (!(_oldSetting isEqualTo _newSetting)) then {
                ACE_player setVariable [QGVAR(isSpeakingInGame), _newSetting, true];
            };
        } , 0.1, []] call CBA_fnc_addPerFrameHandler;

        DFUNC(isSpeaking) = {
            PARAMS_1(_unit);
            (_unit getVariable [QGVAR(isSpeakingInGame), false]) && {!(_unit getVariable ["ACE_isUnconscious", false])}
        };
    };
};
