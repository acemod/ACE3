/**
 * fn_handleDisplayEffects.sqf
 * @Descr: displays visual effects to user
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (!hasInterface) exitwith{};
45 cutRsc [QGVAR(ScreenEffectsBlack),"PLAIN"];

FUNC(hb_effect) = {
    _heartRate = _this select 0;
    if (_heartRate < 0.1) exitwith {};
    _hbSoundsFast = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
    _hbSoundsNorm = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
    _hbSoundsSlow = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];

    if (GVAR(playingHeartBeatSound)) exitwith {};
    GVAR(playingHeartBeatSound) = true;

    _sleep = 60 / _heartRate;
    if (_heartRate < 60) then {
        _sound = _hbSoundsSlow select (random((count _hbSoundsSlow) -1));
        playSound _sound;

            [{
                GVAR(playingHeartBeatSound) = false;
            }, [], _sleep, _sleep] call EFUNC(common,waitAndExecute);
    } else {
        if (_heartRate > 120) then {
            _sound = _hbSoundsFast select (random((count _hbSoundsFast) -1));
            playSound _sound;
            [{
                GVAR(playingHeartBeatSound) = false;
            }, [], _sleep, _sleep] call EFUNC(common,waitAndExecute);
        };
    };
};

GVAR(playingHeartBeatSound) = false;
GVAR(BloodLevel_CC) = ppEffectCreate ["ColorCorrections", 4208];
GVAR(BloodLevel_CC) ppEffectForceInNVG true;
GVAR(BloodLevel_CC) ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,1], [0.2,0.2,0.2,0]];
GVAR(BloodLevel_CC) ppEffectCommit 0;

[{
    private ["_unit","_bloodLoss", "_bloodVolume"];
    _unit = ACE_player;

    if (isNull(findDisplay 312)) then {
        if ([_unit] call EFUNC(common,isAwake) && false) then {
            _bloodLoss = _unit call FUNC(getBloodLoss);
            if (_bloodLoss >0) then {
                [_bloodLoss] call FUNC(effectBleeding);
            };

            [{
                [((_this select 0) getvariable[QGVAR(amountOfPain), 0])] call FUNC(effectPain);
            }, [_unit], 0.25, 0.25] call EFUNC(common,waitAndExecute);

            [(_unit getvariable[QGVAR(heartRate), 70])] call FUNC(hb_effect);
            ["medicalEffectsLoop", [_unit]] call ace_common_fnc_localEvent
        };

         // Blood Level Effect
        _bloodVolume = _unit getVariable [QGVAR(bloodVolume), 100];
        if (_bloodVolume > 99 || !alive _unit) then {
            GVAR(BloodLevel_CC) ppEffectEnable false;
        } else {
            GVAR(BloodLevel_CC) ppEffectEnable true;
            GVAR(BloodLevel_CC) ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 1, 1,_bloodVolume/100], [0.2, 0.2, 0.2, 0]];
            GVAR(BloodLevel_CC) ppEffectCommit 0;
        };
    } else {
        GVAR(BloodLevel_CC) ppEffectEnable false;
    };

 } , 0.5, [] ] call CBA_fnc_addPerFrameHandler;
