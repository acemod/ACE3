// ACE Medical System Visual Loop

#include "script_component.hpp"

if (!hasInterface) exitwith{};

GVAR(heartBeatSounds_Fast) = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Normal) = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Slow) = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(playingHeartBeatSound) = false;

// Initialize all effects
// @todo: make this a macro?
_fnc_createEffect = {
    private ["_type", "_layer", "_default"];
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

// @todo; what's this for?
GVAR(effectUnconsciousUnit) = objNull;

// Initialize Other Variables
GVAR(effectBlind) = false;
GVAR(effectTimeBlood) = time;

// TODO add settings to allow modification of what is being displayed.
[{
    // Zeus interface is open; disable everything
    if (!isNull (findDisplay 312)) exitWith {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        GVAR(effectBlindingCC) ppEffectEnable false;
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
        GVAR(effectPainCA) ppEffectEnable false;
        GVAR(effectPainCC) ppEffectEnable false;
    };

    // Player is dead; disable everything and reenable input
    if (!alive ACE_player) exitWith {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        GVAR(effectBlindingCC) ppEffectEnable false;
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
        GVAR(effectPainCA) ppEffectEnable false;
        GVAR(effectPainCC) ppEffectEnable false;
        [false] call EFUNC(common,disableUserInput); // @todo, only when disabled?
    };

    // @todo: merge the above?

    // Unconsciousness effect
    if (ACE_player getVariable [QGVAR(isUnconscious), false]) then {
        GVAR(effectUnconsciousCC) ppEffectEnable true;
        GVAR(effectUnconsciousRB) ppEffectEnable true;
        GVAR(effectBlind) = true;
        [true, true] call EFUNC(common,disableUserInput); // @todo, see above
    } else {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        [false] call EFUNC(common,disableUserInput); // @todo, see above
        if (GVAR(effectBlind)) then {
            // @todo: blinding effect on wakeup
        };
    };

    // @todo: pain effect

    // Bleeding Indicator
    // @todo: redo this after initial release
    if (damage ACE_player > 0.1 and GVAR(effectTimeBlood) + 6 < time) then {
        GVAR(effectTimeBlood) = time;
        [500 * damage ACE_player] call BIS_fnc_bloodEffect;
    };

    // Blood Volume Effect
    _blood = AGM_player getVariable ["AGM_Blood", 100] / 100;
    if (_blood > 0.99) then {
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
    } else {
        GVAR(effectBloodVolumeCC) ppEffectEnable true;
        GVAR(effectBloodVolumeCC) ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,_blood], [0.2,0.2,0.2,0]];
        GVAR(effectBloodVolumeCC) ppEffectCommit 0;
    };
 
/*
    private ["_unit","_bloodLoss", "_bloodVolume"];
    _unit = ACE_player;

    if (isNull(findDisplay 312) && alive _unit) then {
        if ([_unit] call EFUNC(common,isAwake)) then {
            _bloodLoss = _unit call FUNC(getBloodLoss);
            if (_bloodLoss >0) then {
                _time = 10 - _bloodLoss;
                if (_time < 1.5) then {
                    _time = 1.5;
                };
                if (time - (missionNamespace getvariable [QGVAR(displayedBleedingEffectMoment), -10])) then {
                    missionNamespace setvariable [QGVAR(displayedBleedingEffectMoment), time];

                    // call bleeding effect
                };
            };

            // Heart rate sound effect
            _heartRate = _unit getvariable[QGVAR(heartRate), 70];
            if (_heartRate > 0.1) then {
                if (GVAR(playingHeartBeatSound)) exitwith {};
                GVAR(playingHeartBeatSound) = true;
                _sleep = 60 / _heartRate;
                if (_heartRate < 60) then {
                    _sound = GVAR(heartBeatSounds_Slow) select (random((count GVAR(heartBeatSounds_Slow)) -1));
                    playSound _sound;
                    [{
                        GVAR(playingHeartBeatSound) = false;
                    }, [], _sleep, _sleep] call EFUNC(common,waitAndExecute);
                } else {
                    if (_heartRate > 120) then {
                        _sound = GVAR(heartBeatSounds_Fast) select (random((count GVAR(heartBeatSounds_Fast)) -1));
                        playSound _sound;
                        [{
                            GVAR(playingHeartBeatSound) = false;
                        }, [], _sleep, _sleep] call EFUNC(common,waitAndExecute);
                    };
                };
            };

            // TODO implement a new pain effect.
        };
        if (_unit getvariable ["ACE_isUnconscious", false] && GVAR(effectUnconsciousUnit) != _unit) then {
            GVAR(effectUnconsciousUnit) = _unit;

            // handle the unconscious effects.
            [] call EFUNC(common,closeAllDialogs_f);
            //[true] call FUNC(effectBlackOut);
            ["unconscious", true] call EFUNC(common,setDisableUserInputStatus);
            [false] call EFUNC(common,setVolume_f);
        } else {
            if (GVAR(effectUnconsciousUnit) == _unit) then {
                GVAR(effectUnconsciousUnit) = ObjNull;

                //[false] call FUNC(effectBlackOut);
                ["unconscious", false] call EFUNC(common,setDisableUserInputStatus);
                [true] call EFUNC(common,setVolume_f);
            };
        };

        // Blood volume grayscale Effect
        _bloodVolume = _unit getVariable [QGVAR(bloodVolume), 100];
        if (_bloodVolume > 99 || !alive _unit) then {
            GVAR(effect_BloodLevel_CC) ppEffectEnable false;
        } else {
            GVAR(effect_BloodLevel_CC) ppEffectEnable true;
            GVAR(effect_BloodLevel_CC) ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 1, 1,_bloodVolume/100], [0.2, 0.2, 0.2, 0]];
            GVAR(effect_BloodLevel_CC) ppEffectCommit 0;
        };
    } else {
        GVAR(effect_BloodLevel_CC) ppEffectEnable false;
        if (!isNull GVAR(effectUnconsciousUnit)) then {
            GVAR(effectUnconsciousUnit) = ObjNull;
            //[false] call FUNC(effectBlackOut);
            ["unconscious", false] call EFUNC(common,setDisableUserInputStatus);
            [true] call EFUNC(common,setVolume_f);
        };
    };
*/
}, 0.5, [] ] call CBA_fnc_addPerFrameHandler;
