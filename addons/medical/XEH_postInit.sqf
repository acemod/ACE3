// ACE Medical System Visual Loop

#include "script_component.hpp"

GVAR(heartBeatSounds_Fast) = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3"];
GVAR(heartBeatSounds_Normal) = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
GVAR(heartBeatSounds_Slow) = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2"];

["ace_interactMenuClosed", {[objNull, false] call FUNC(displayPatientInformation); }] call CBA_fnc_addEventHandler;

//Treatment EventHandlers:
[QGVAR(actionCheckBloodPressureLocal), DFUNC(actionCheckBloodPressureLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionCheckPulseLocal), DFUNC(actionCheckPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(addVitalLoop), DFUNC(addVitalLoop)] call CBA_fnc_addEventHandler;
[QGVAR(addToMedicalLog), DFUNC(addToLog)] call CBA_fnc_addEventHandler;
[QGVAR(addToTriageCard), DFUNC(addToTriageCard)] call CBA_fnc_addEventHandler;
[QGVAR(setDead), DFUNC(setDead)] call CBA_fnc_addEventHandler;
[QGVAR(setHitPointDamage), DFUNC(setHitPointDamage)] call CBA_fnc_addEventHandler;
[QGVAR(setUnconscious), DFUNC(setUnconscious)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_bandageLocal), DFUNC(treatmentAdvanced_bandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_CPRLocal), DFUNC(treatmentAdvanced_CPRLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_fullHealLocal), DFUNC(treatmentAdvanced_fullHealLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentAdvanced_medicationLocal), DFUNC(treatmentAdvanced_medicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentBasic_bloodbagLocal), DFUNC(treatmentBasic_bloodbagLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentBasic_morphineLocal), DFUNC(treatmentBasic_morphineLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentIVLocal), DFUNC(treatmentIVLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentTourniquetLocal), DFUNC(treatmentTourniquetLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionPlaceInBodyBag), FUNC(actionPlaceInBodyBag)] call CBA_fnc_addEventHandler;

//Handle Deleting Bodies and creating litter on Server:
if (isServer) then {
    ["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;
    [QGVAR(createLitterServer), FUNC(handleCreateLitter)] call CBA_fnc_addEventHandler;
    addMissionEventHandler ["BuildingChanged", {
        if (isNil QGVAR(allCreatedLitter)) exitWith {};
        params ["_buildingOld", "_buildingNew", "_isRuin"];
        TRACE_3("BuildingChanged",_buildingOld,_buildingNew,_isRuin);
        private _radius = sizeOf typeOf _buildingOld / 2;
        TRACE_1("",_radius);
        {
            _x params ["", "_objects"];
            if (({(_x distance2d _buildingOld) < _radius && {getPos _x select 2 > 0.1}} count _objects) > 0) then {
                GVAR(allCreatedLitter) deleteAt (GVAR(allCreatedLitter) find _x);
                { TRACE_1("deleting",_x); deleteVehicle _x } forEach _objects;
            };
        } forEach (+GVAR(allCreatedLitter));
    }];
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


// Initialize all effects
if (hasInterface) then {

_fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
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
GVAR(effectTimeBlood) = CBA_missionTime;

// MAIN EFFECTS LOOP
[{
    // Zeus interface is open or player is dead; disable everything
    if (!(isNull curatorCamera) or !(alive ACE_player)) exitWith {
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
            }, [_strength], 0.01, 0] call CBA_fnc_waitAndExecute;

            [{
                GVAR(effectBlindingCC) ppEffectEnable false;
            }, [], (_strength * 2) + 0.5, 0] call CBA_fnc_waitAndExecute;

            GVAR(effectBlind) = false;
        };
    };

    private _bleeding = [ACE_player] call FUNC(getBloodLoss);
    // Bleeding Indicator
    if (_bleeding > 0 and GVAR(effectTimeBlood) + 3.5 < CBA_missionTime) then {
        GVAR(effectTimeBlood) = CBA_missionTime;
        [600 * _bleeding] call FUNC(showBloodEffect);
    };

    // Blood Volume Effect
    private _blood = if (GVAR(level) < 2) then {
        (ACE_player getVariable [QGVAR(bloodVolume), 100]) / 100;
    } else {
        (((ACE_player getVariable [QGVAR(bloodVolume), 100]) - 60) max 0) / 40;
    };

    if (_blood > 0.99) then {
        GVAR(effectBloodVolumeCC) ppEffectEnable false;
    } else {
        GVAR(effectBloodVolumeCC) ppEffectEnable true;
        GVAR(effectBloodVolumeCC) ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,_blood], [0.2,0.2,0.2,0]];
        GVAR(effectBloodVolumeCC) ppEffectCommit 0;
    };
}, 0.5, []] call CBA_fnc_addPerFrameHandler;


GVAR(lastHeartBeat) = CBA_missionTime;
GVAR(lastHeartBeatSound) = CBA_missionTime;

// HEARTRATE BASED EFFECTS
[{
    private _heartRate = ACE_player getVariable [QGVAR(heartRate), 70];
    private _pain = ACE_player getVariable [QGVAR(pain), 0];
    if (GVAR(level) == 1) then {
        _heartRate = 60 + 40 * _pain;
    };
    if (_heartRate <= 0) exitWith {};
    private _interval = 60 / (_heartRate min 40);

    if ((ACE_player getVariable ["ACE_isUnconscious", false])) then {
        if (GVAR(painEffectType) == 1) then {
            GVAR(effectPainCA) ppEffectEnable false;
        } else {
            GVAR(effectPainCC) ppEffectEnable false;
        };
    } else {
        if ((CBA_missionTime > GVAR(lastHeartBeat) + _interval)) then {
            GVAR(lastHeartBeat) = CBA_missionTime;

            // Pain effect, no pain effect in zeus camera
            if (isNull curatorCamera) then {
                private _strength = ((_pain - (ACE_player getVariable [QGVAR(painSuppress), 0])) max 0) min 1;
                _strength = _strength * (ACE_player getVariable [QGVAR(painCoefficient), GVAR(painCoefficient)]);
                if (GVAR(painEffectType) == 1) then {
                    GVAR(effectPainCC) ppEffectEnable false;
                    if (_pain > (ACE_player getVariable [QGVAR(painSuppress), 0]) && {alive ACE_player}) then {
                        _strength = _strength * 0.15;
                        GVAR(effectPainCA) ppEffectEnable true;
                        GVAR(effectPainCA) ppEffectAdjust [_strength, _strength, false];
                        GVAR(effectPainCA) ppEffectCommit 0.01;
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.2], _interval * 0.05, 0] call CBA_fnc_waitAndExecute;
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit 0.01;
                        }, [_strength * 0.7], _interval * 0.3, 0] call CBA_fnc_waitAndExecute;
                        [{
                            GVAR(effectPainCA) ppEffectAdjust [(_this select 0), (_this select 0), false];
                            GVAR(effectPainCA) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.55], _interval * 0.4, 0] call CBA_fnc_waitAndExecute;
                    } else {
                        GVAR(effectPainCA) ppEffectEnable false;
                    };
                } else {
                    GVAR(effectPainCA) ppEffectEnable false;
                    if (_pain > (ACE_player getVariable [QGVAR(painSuppress), 0]) && {alive ACE_player}) then {
                        _strength = _strength * 0.9;
                        GVAR(effectPainCC) ppEffectEnable true;
                        GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - _strength,1 - _strength,0,0,0,0.2,2]];
                        GVAR(effectPainCC) ppEffectCommit 0.01;
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.2], _interval * 0.05, 0] call CBA_fnc_waitAndExecute;
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit 0.01;
                        }, [_strength * 0.7], _interval * 0.3, 0] call CBA_fnc_waitAndExecute;
                        [{
                            GVAR(effectPainCC) ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
                            GVAR(effectPainCC) ppEffectCommit (_this select 1);
                        }, [_strength * 0.1, _interval * 0.55], _interval * 0.4, 0] call CBA_fnc_waitAndExecute;
                    } else {
                        GVAR(effectPainCC) ppEffectEnable false;
                    };
                };
            };
        };
    };

    if (GVAR(level) >= 2 && {_heartRate > 0}) then {
        private _minTime = 60 / _heartRate;
        if (CBA_missionTime - GVAR(lastHeartBeatSound) > _minTime) then {
            GVAR(lastHeartBeatSound) = CBA_missionTime;
            // Heart rate sound effect
            if (_heartRate < 60) then {
                private _sound = GVAR(heartBeatSounds_Normal) select (random((count GVAR(heartBeatSounds_Normal)) -1));
                playSound _sound;
            } else {
                if (_heartRate > 150) then {
                    playSound "ACE_heartbeat_fast_2";
                };
            };
        };
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;
};

["ace_settingsInitialized", {
    [
        {(((_this select 0) getVariable [QGVAR(bloodVolume), 100]) < 65)},
        {(((_this select 0) getVariable [QGVAR(pain), 0]) - ((_this select 0) getVariable [QGVAR(painSuppress), 0])) > 0.9},
        {(([_this select 0] call FUNC(getBloodLoss)) > 0.25)},
        {((_this select 0) getVariable [QGVAR(inReviveState), false])},
        {((_this select 0) getVariable [QGVAR(inCardiacArrest), false])},
        {((_this select 0) getVariable ["ACE_isDead", false])}
    ] call FUNC(addUnconsciousCondition);

}] call CBA_fnc_addEventHandler;

// Prevent all types of interaction while unconscious
// @todo: probably remove this when CBA keybind hold key works properly
["isNotUnconscious", {!((_this select 0) getVariable ["ACE_isUnconscious", false])}] call EFUNC(common,addCanInteractWithCondition);

// Item Event Handler
["loadout", FUNC(itemCheck)] call CBA_fnc_addPlayerEventHandler;

if (hasInterface) then {
    ["ace_playerJIP", {
        INFO("JIP Medical init for player.");
        [player] call FUNC(init);
    }] call CBA_fnc_addEventHandler;
};

if (["ACE_Arsenal"] call EFUNC(common,isModLoaded)) then {
    [QEGVAR(arsenal,displayOpened), {
        EGVAR(arsenal,virtualItems) set [17, (EGVAR(arsenal,virtualItems) select 17) -  ["FirstAidKit", "Medikit"]];
    }] call CBA_fnc_addEventHandler;
};
