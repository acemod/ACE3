/*
 * Author: Glowbal, PabstMirror
 * Starts up a PFEH to monitor the when players are talking.
 * Compatiblity with TFR/ACRE and Arma's VON
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nametags_fnc_initIsSpeaking
 *
 * Public: No
 */
#include "script_component.hpp"

if (isServer) then {
    //If someone disconnects while speaking, reset their variable
    addMissionEventHandler ["HandleDisconnect", {
        params ["_disconnectedPlayer"];
        if (_disconnectedPlayer getVariable [QGVAR(isSpeakingInGame), false]) then {
            _disconnectedPlayer setVariable [QGVAR(isSpeakingInGame), false, true];
        };
    }];
};

if (!hasInterface) exitWith {};

["unit", {
    //When player changes, make sure to reset old unit's variable
    params ["", "_oldUnit"];
    if ((!isNull _oldUnit) && {_oldUnit getVariable [QGVAR(isSpeakingInGame), false]}) then {
        _oldUnit setVariable [QGVAR(isSpeakingInGame), false, true];
    };
}] call CBA_fnc_addPlayerEventHandler;

if (isClass (configFile >> "CfgPatches" >> "acre_api")) then {
    INFO("ACRE Detected.");
    DFUNC(isSpeaking) = {
        params ["_unit"];
        ([_unit] call acre_api_fnc_isSpeaking) && {!(_unit getVariable ["ACE_isUnconscious", false])}
    };
} else {
    if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
        INFO("TFR Detected.");
        DFUNC(isSpeaking) =     {
            params ["_unit"];
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
            params ["_unit"];
            (_unit getVariable [QGVAR(isSpeakingInGame), false]) && {!(_unit getVariable ["ACE_isUnconscious", false])}
        };
    };
};
