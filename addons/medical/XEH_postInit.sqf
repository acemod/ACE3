// ACE Medical System Visual Loop

#include "script_component.hpp"

GVAR(heartBeatSounds_Fast) = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3"];
GVAR(heartBeatSounds_Normal) = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Slow) = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2"];

["medical_propagateWound", FUNC(onPropagateWound)] call EFUNC(common,addEventHandler);
["medical_woundUpdateRequest", FUNC(onWoundUpdateRequest)] call EFUNC(common,addEventHandler);
["interactMenuClosed", {[objNull, false] call FUNC(displayPatientInformation); }] call EFUNC(common,addEventHandler);

["medical_onUnconscious", {
    if (local (_this select 0)) then {
        private ["_unit"];
        _unit = _this select 0;
        if (_this select 1) then {
            _unit setVariable ["tf_globalVolume", 0.4];
            _unit setVariable ["tf_voiceVolume", 0, true];
            _unit setVariable ["tf_unable_to_use_radio", true, true];

            _unit setVariable ["acre_sys_core_isDisabled", true, true];
            if (!isNil "acre_api_fnc_setGlobalVolume") then { [0.4^0.33] call acre_api_fnc_setGlobalVolume; };
        } else {
            _unit setVariable ["tf_globalVolume", 1];
            _unit setVariable ["tf_voiceVolume", 1, true];
            _unit setVariable ["tf_unable_to_use_radio", false, true];

            _unit setVariable ["acre_sys_core_isDisabled", false, true];
            if (!isNil "acre_api_fnc_setGlobalVolume") then { [1] call acre_api_fnc_setGlobalVolume; };
        };
    };
}] call EFUNC(common,addEventHandler);


// Initialize all effects
_fnc_createEffect = {
    private ["_type", "_layer", "_default", "_effect"];
    _type = _this select 0;
    _layer = _this select 1;
    _default = _this select 2;

    _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

GVAR(effectUnconsciousCC) = [
    "ColorCorrections",
    4201,
    [1,1,0, [0,0,0,1], [0,0,0,0], [1,1,1,1], [0.4,0.4,0,0,0,0.1,0.3]]
] call _fnc_createEffect;

GVAR(effectUnconsciousRB) = [
    "RadialBlur",
    4202,
    [0.01,0.01,0,0]
] call _fnc_createEffect;

GVAR(effectBlindingCC) = [
    "ColorCorrections",
    4203,
    [1,1,0, [1,1,1,0], [0,0,0,1], [0,0,0,0]]
] call _fnc_createEffect;

GVAR(effectBloodVolumeCC) = [
    "ColorCorrections",
    4204,
    [1,1,0, [0,0,0,0], [1,1,1,1], [0.2,0.2,0.2,0]]
] call _fnc_createEffect;

GVAR(effectPainCA) = [
    "chromAberration",
    4205,
    [0, 0, false]
] call _fnc_createEffect;

GVAR(effectPainCC) = [
    "ColorCorrections",
    4206,
    [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1.3,1.3,0,0,0,0.2,2]]
] call _fnc_createEffect;

// Initialize Other Variables
GVAR(effectBlind) = false;
GVAR(effectTimeBlood) = ACE_time;

// MAIN EFFECTS LOOP
[{
    private["_bleeding", "_blood"];
    // Zeus interface is open, player is dead or remote controlled unit; disable everything
    if (!(isNull curatorCamera) or !(alive ACE_player) or (player != ACE_player)) exitWith {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        GVAR(effectBlindingCC) ppEffectEnable false;
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
        GVAR(effectPainCA) ppEffectEnable false;
        GVAR(effectPainCC) ppEffectEnable false;
        ["unconscious", false] call EFUNC(common,setDisableUserInputStatus);
    };

    // Unconsciousness effect
    if (ACE_player getVariable ["ACE_isUnconscious", false]) then {
        GVAR(effectUnconsciousCC) ppEffectEnable true;
        GVAR(effectUnconsciousRB) ppEffectEnable true;
        GVAR(effectBlind) = true;
        ["unconscious", true] call EFUNC(common,setDisableUserInputStatus);
    } else {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        ["unconscious", false] call EFUNC(common,setDisableUserInputStatus);
        if (GVAR(effectBlind)) then {
            _strength = 0.78 * (call EFUNC(common,ambientBrightness));
            GVAR(effectBlindingCC) ppEffectEnable true;
            GVAR(effectBlindingCC) ppEffectAdjust [1,1,_strength, [1,1,1,0], [0,0,0,1], [0,0,0,0]];
            GVAR(effectBlindingCC) ppEffectCommit 0;

            [{
                GVAR(effectBlindingCC) ppEffectAdjust [1,1,0, [1,1,1,0], [0,0,0,1], [0,0,0,0]];
                GVAR(effectBlindingCC) ppEffectCommit ((_this select 0) * 2);
            }, [_strength], 0.01, 0] call EFUNC(common,waitAndExecute);

            [{
                GVAR(effectBlindingCC) ppEffectEnable false;
            }, [], (_strength * 2) + 0.5, 0] call EFUNC(common,waitAndExecute);

            GVAR(effectBlind) = false;
        };
    };

    _bleeding = [ACE_player] call FUNC(getBloodLoss);
    // Bleeding Indicator
    if (_bleeding > 0 and GVAR(effectTimeBlood) + 3.5 < ACE_time) then {
        GVAR(effectTimeBlood) = ACE_time;
        [600 * _bleeding] call BIS_fnc_bloodEffect;
    };

    // Blood Volume Effect
    _blood = (ACE_player getVariable [QGVAR(bloodVolume), 100]) / 100;
    if (_blood > 0.99) then {
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
    } else {
        GVAR(effectBloodVolumeCC) ppEffectEnable true;
        GVAR(effectBloodVolumeCC) ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,_blood], [0.2,0.2,0.2,0]];
        GVAR(effectBloodVolumeCC) ppEffectCommit 0;
    };
}, 0.5, []] call CBA_fnc_addPerFrameHandler;


GVAR(lastHeartBeat) = ACE_time;
GVAR(lastHeartBeatSound) = ACE_time;

// HEARTRATE BASED EFFECTS
[{
    private["_heartRate", "_interval", "_minTime", "_sound", "_strength", "_pain"];
    _heartRate = ACE_player getVariable [QGVAR(heartRate), 70];
    _pain = ACE_player getVariable [QGVAR(pain), 0];
    if (GVAR(level) == 1) then {
        _heartRate = 60 + 40 * _pain;
    };
    if (_heartRate <= 0) exitwith {};
    _interval = 60 / (_heartRate min 50);

    if ((ACE_player getVariable ["ACE_isUnconscious", false])) then {
        if (GVAR(painEffectType) == 1) then {
            GVAR(effectPainCA) ppEffectEnable false;
        } else {
            GVAR(effectPainCC) ppEffectEnable false;
        };
    } else {
        if ((ACE_time > GVAR(lastHeartBeat) + _interval)) then {
            GVAR(lastHeartBeat) = ACE_time;

            // Pain effect, no pain effect in zeus camera and for remote controlled unit
            if (isNull curatorCamera && player == ACE_player) then {
                _strength = (_pain - (ACE_player getvariable [QGVAR(painSuppress), 0])) max 0;
                _strength = _strength * (ACE_player getVariable [QGVAR(painCoefficient), GVAR(painCoefficient)]);
                if (GVAR(painEffectType) == 1) then {
                    GVAR(effectPainCC) ppEffectEnable false;
                    if (_pain > (ACE_player getvariable [QGVAR(painSuppress), 0]) && {alive ACE_player}) then {
                        _strength = _strength * 0.15;
                        GVAR(effectPainCA) ppEffectEnable true;
                        GVAR(effectPainCA) ppEffectAdjust [_strength, _strength, false];
                        GVAR(effectPainCA) ppEffectCommit 0.01;
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.2], _interval * 0.05, 0] call EFUNC(common,waitAndExecute);
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit 0.01;
                        }, [_strength * 0.7], _interval * 0.3, 0] call EFUNC(common,waitAndExecute);
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.55], _interval * 0.4, 0] call EFUNC(common,waitAndExecute);
                    } else {
                        GVAR(effectPainCA) ppEffectEnable false;
                    };
                } else {
                    GVAR(effectPainCA) ppEffectEnable false;
                    if (_pain > (ACE_player getvariable [QGVAR(painSuppress), 0]) && {alive ACE_player}) then {
                        _strength = _strength * 0.9;
                        GVAR(effectPainCC) ppEffectEnable true;
                        GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - _strength,1 - _strength,0,0,0,0.2,2]];
                        GVAR(effectPainCC) ppEffectCommit 0.01;
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.2], _interval * 0.05, 0] call EFUNC(common,waitAndExecute);
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit 0.01;
                        }, [_strength * 0.7], _interval * 0.3, 0] call EFUNC(common,waitAndExecute);
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.55], _interval * 0.4, 0] call EFUNC(common,waitAndExecute);
                    } else {
                        GVAR(effectPainCC) ppEffectEnable false;
                    };
                };
            };
        };
    };

    if (GVAR(level) >= 2 && {_heartRate > 0}) then {
        _minTime = 60 / _heartRate;
        if (ACE_time - GVAR(lastHeartBeatSound) > _minTime) then {
            GVAR(lastHeartBeatSound) = ACE_time;
            // Heart rate sound effect
            if (_heartRate < 60) then {
                _sound = GVAR(heartBeatSounds_Normal) select (random((count GVAR(heartBeatSounds_Normal)) -1));
                playSound _sound;
            } else {
                if (_heartRate > 150) then {
                    playSound "ACE_heartbeat_fast_2";
                };
            };
        };
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;

if (USE_WOUND_EVENT_SYNC) then {
    // broadcast injuries to JIP clients in a MP session
    if (isMultiplayer && hasInterface) then {
        ["playerChanged", {
            EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);
            if (alive _newPlayer) then {
                // We are only pulling the wounds for the units in the player group. Anything else will come when the unit interacts with them.
                {
                    [_x, _newPlayer] call FUNC(requestWoundSync);
                }foreach units group _newPlayer;
            };
        }] call EFUNC(common,addEventhandler);
    };
};

[
    {(((_this select 0) getvariable [QGVAR(bloodVolume), 100]) < 65)},
    {(((_this select 0) getvariable [QGVAR(pain), 0]) - ((_this select 0) getvariable [QGVAR(painSuppress), 0])) > 0.9},
    {(([_this select 0] call FUNC(getBloodLoss)) > 0.25)},
    {((_this select 0) getvariable [QGVAR(inReviveState), false])},
    {((_this select 0) getvariable [QGVAR(inCardiacArrest), false])},
    {((_this select 0) getvariable ["ACE_isDead", false])},
    {(((_this select 0) getvariable [QGVAR(airwayStatus), 100]) < 80)}
] call FUNC(addUnconsciousCondition);

// Prevent all types of interaction while unconscious
// @todo: probably remove this when CBA keybind hold key works properly
["isNotUnconscious", {!((_this select 0) getVariable ["ACE_isUnconscious", false])}] call EFUNC(common,addCanInteractWithCondition);

// Item Event Handler
["playerInventoryChanged", {
    [ACE_player] call FUNC(itemCheck);
}] call EFUNC(common,addEventHandler);

// Networked litter
[QGVAR(createLitter), FUNC(handleCreateLitter), GVAR(litterCleanUpDelay)] call EFUNC(common,addSyncedEventHandler);

if (hasInterface) then {
    ["PlayerJip", {
        diag_log format["[ACE] JIP Medical init for player"];
        [player] call FUNC(init);
    }] call EFUNC(common,addEventHandler);
};
