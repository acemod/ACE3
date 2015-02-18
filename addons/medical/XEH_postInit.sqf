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


// MAIN EFFECTS LOOP
[{
    // Zeus interface is open or player is dead; disable everything
    if (!(isNull (findDisplay 312)) or !(alive ACE_player)) exitWith {
        GVAR(effectUnconsciousCC) ppEffectEnable false;
        GVAR(effectUnconsciousRB) ppEffectEnable false;
        GVAR(effectBlindingCC) ppEffectEnable false;
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
        GVAR(effectPainCA) ppEffectEnable false;
        GVAR(effectPainCC) ppEffectEnable false;
        [false] call EFUNC(common,disableUserInput); // @todo, only when disabled?
    };

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

    // @todo: pain effect

    // Bleeding Indicator
    // @todo: redo this after initial release
    if (damage ACE_player > 0.1 and GVAR(effectTimeBlood) + 6 < time) then {
        GVAR(effectTimeBlood) = time;
        [500 * damage ACE_player] call BIS_fnc_bloodEffect;
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


GVAR(lastHeartBeat) = time;

// @todo, remove once parameters are set up
if (isNil QGVAR(level)) then {
  GVAR(level) = 0;
};

// HEARTRATE BASED EFFECTS
[{
    _heartRate = ACE_player getVariable [QGVAR(heartRate), 70];
    if (GVAR(level) == 0) then {
        _heartRate = 60 + 40 * (ACE_player getVariable [QGVAR(pain), 0]);
        _heartRate = _heartRate min 120;
    };
    _interval = 60 / _heartRate;
    if (time < GVAR(lastHeartBeat) + _interval) exitWith {};
    GVAR(lastHeartBeat) = time;

    // Pain effect
    _strength = ACE_player getVariable [QGVAR(pain), 0];
    // _strength = _strength * (ACE_player getVariable [QGVAR(coefPain), GVAR(coefPain)]); @todo
    GVAR(alternativePainEffect) = false; // @todo
    if (GVAR(alternativePainEffect)) then {
        GVAR(effectPainCC) ppEffectEnable false;
        if ((ACE_player getVariable [QGVAR(pain), 0]) > 0 && {alive ACE_player}) then {
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
        if ((ACE_player getVariable [QGVAR(pain), 0]) > 0 && {alive ACE_player}) then {
            _strength = _strength * 0.6;
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

    /* @todo
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
    */
}, 0, []] call CBA_fnc_addPerFrameHandler;
