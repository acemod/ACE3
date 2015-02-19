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
        if (_disconnectedPlayer getVariable [QGVAR(isSpeaking), false]) then {
            _disconnectedPlayer setVariable [QGVAR(isSpeaking), false, true];
        };
    }];
};

if (!hasInterface) exitWith {};

["playerChanged", {
    //When player changes, make sure to reset old unit's variable
    PARAMS_2(_newUnit,_oldUnit);
    if (_oldUnit getVariable [QGVAR(isSpeaking), false]) then {
        _oldUnit setVariable [QGVAR(isSpeaking), false, true];
    };
}] call EFUNC(common,addEventHandler);


//For performance, chose different code paths at mission start based on installed mods (once, instead of checking each time)
_pfEHCode = switch (true) do {
case (isClass (configFile >> "cfgPatches" >> "acre_api")): {
        {
            _oldSetting = ACE_player getVariable [QGVAR(isSpeaking), false];
            _newSetting = ([ACE_player] call ACRE_api_fnc_isBroadcasting) || {!(isNull findDisplay 55)};
            if (!(_oldSetting isEqualTo _newSetting)) then {
                ACE_player setVariable [QGVAR(isSpeaking), _newSetting, true];
            };
        };
    };
case (isClass (configFile >> "cfgPatches" >> "task_force_radio")): {
        //Note: TFAR has a TFAR_fnc_isSpeaking function, but it has a fairly costly `callExtension`
        //I think it's much faster to use the internal "tf_isSpeaking" variable
        //If we don't care about the built-in VON, we could switch this to a pure event driven system
        {
            _oldSetting = ACE_player getVariable [QGVAR(isSpeaking), false];
            _newSetting = (ACE_player getVariable ["tf_isSpeaking", false]) || {!(isNull findDisplay 55)};
            if (!(_oldSetting isEqualTo _newSetting)) then {
                ACE_player setVariable [QGVAR(isSpeaking), _newSetting, true];
            };
        };
    };
    default {
        //Note:  class RscDisplayVoiceChat {idd = 55};  //only present when talking
        {
            _oldSetting = ACE_player getVariable [QGVAR(isSpeaking), false];
            _newSetting = (!(isNull findDisplay 55));
            if (!(_oldSetting isEqualTo _newSetting)) then {
                ACE_player setVariable [QGVAR(isSpeaking), _newSetting, true];
            };
        };
    };
};

//Is 0.05sec precision enough??
[_pfEHCode, 0.05, []] call CBA_fnc_addPerFrameHandler;
