
#include "script_component.hpp"

if (!hasInterface) exitwith{};
//45 cutRsc [QGVAR(ScreenEffectsBlack),"PLAIN"];

GVAR(heartBeatSounds_Fast) = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Normal) = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Slow) = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];

GVAR(playingHeartBeatSound) = false;
GVAR(effect_BloodLevel_CC) = ppEffectCreate ["ColorCorrections", 4208];
GVAR(effect_BloodLevel_CC) ppEffectForceInNVG true;
GVAR(effect_BloodLevel_CC) ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,1], [0.2,0.2,0.2,0]];
GVAR(effect_BloodLevel_CC) ppEffectCommit 0;

GVAR(effectUnconsciousUnit) = objNull;

// TODO add settings to allow modification of what is being displayed.
[{
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

 }, 0.5, [] ] call CBA_fnc_addPerFrameHandler;
