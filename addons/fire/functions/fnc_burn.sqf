#include "script_component.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
/*
 * Author: Brandon (TCVM)
 * Makes object catch fire. Only call from events
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Intensity of fire <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 4] call ace_fire_fnc_burn
 *
 * Public: No
 */
#define INTENSITY_LOSS 0.03
#define INTENSITY_UPDATE 3
#define BURN_PROPOGATE_UPDATE 1
#define BURN_PROPOGATE_DISTANCE 2
#define BURN_PROPOGATE_COUNTER_MAX 5
#define MAX_INTENSITY 10
#define MIN_INTENSITY 1
params ["_unit", "_intensity", ["_instigator", objNull]];

if !(GVAR(enabled)) exitWith {};

private _isBurning = [_unit] call FUNC(isBurning);
if (_isBurning) exitWith {};

[{
    // looped function
    (_this getVariable "params") params ["_unit", "", "_instigator"];
    private _unitPos = getPos _unit;
    
    _intensity = _unit getVariable [QGVAR(intensity), 0];
    
    if (surfaceIsWater _unitPos && {(_unitPos#2) < 1}) then {
        _intensity = 0;
    };
    
    _fireParticle setDropInterval (0.01 max linearConversion [MAX_INTENSITY, MIN_INTENSITY, _intensity, 0.03, 0.1, false]);
    _fireParticle setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32], // sprite sheet values
        "", // animation name
        "Billboard", // particle type
        1, // timer period
        0.7, // lifetime
        "destructionEffect2", // position
        [0, 0, 1], // move velocity
        0, // rotation velocity
        10, // weight
        7.9, // volume
        1, // rubbing
        [0.3, 0.3], // size
        [
            [1, 1, 1, -0],
            [1, 1, 1, -1],
            [1, 1, 1, -1],
            [1, 1, 1, -1],
            [1, 1, 1, -0]
        ], // colour
        [0.5, 1], // animation speed
        1, // random dir period
        0, // random dir intensity
        "", // on timer script
        "", // before destroy script
        _unit, // particle source
        0,
        false,
        0,
        [[0.8, 0.6, 0.2, 1]] // emissive color
    ];
    _fireParticle setParticleRandom [
        0.04 * _intensity, // life time
        [0.05, 0.05, 2], // position
        [0.05 * _intensity, 0.05 * _intensity, 0.05 * _intensity], // move velocity
        0, // rotation velocity
        0.06 * _intensity, // size
        [0, 0, 0, 0], // color
        0, // random direction period
        0 // random direction intensity
    ];
    
    _smokeParticle setParticleCircle [0, [0, 0, 0]];
    _smokeParticle setParticleRandom [
        0, // life time
        [0.25, 0.25, 0], // position
        [0.2, 0.2, 0], // move velocity
        0, // rotation velocity
        0.25, // size
        [0, 0, 0, 0.1], // color
        0, // random direction period
        0 // random direction intensity
    ];
    _smokeParticle setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48], // sprite sheet values
        "", // animation name
        "Billboard", // particle type
        1, // timer period
        8, // lifetime
        [0, 0, 1.1], // position
        [0, 0, 1], // move velocity
        0, // rotation velocity
        10, // weight
        7.9, // volume
        0.066, // rubbing
        [1, 3, 6], // size
        [
            [0.5, 0.5, 0.5, 0.15],
            [0.75, 0.75, 0.75, 0.075],
            [1, 1, 1, 0]
        ], // colour
        [0.125], // animation speed
        1, // random dir period
        0, // random dir intensity
        "", // on timer script
        "", // before destroy script
        _unit // particle source
    ];
    _smokeParticle setDropInterval 0.15;
    
    _fireLight setLightBrightness ((_intensity * 3) / 10);
    _lightFlare setLightBrightness (_intensity / 30);
    
    private _distanceToUnit = (_unit distance ACE_PLAYER);
    _fireLight setLightAttenuation [1, 10 max (5 min (10 - _intensity)), 0, 15];
    _lightFlare setLightFlareSize (_intensity * (3 / 4)) * FLARE_SIZE_MODIFIER;
    
    // always keep flare visible to percieving unit as long as it isnt the player
    if !(_unit isEqualTo ACE_PLAYER) then {
        private _relativeAttachPoint = [0, 0, 0.3];
        if (_distanceToUnit > 1.5) then {
            _relativeAttachPoint = (vectorNormalized (_unit worldToModelVisual (getPos ACE_PLAYER))) vectorMultiply linearConversion [5, 30, _distanceToUnit, 0.5, 1.5];
            _relativeAttachPoint set [2, 0.3 + ((_unit selectionPosition "pelvis") select 2)];
        };
        _lightFlare attachTo [_unit, _relativeAttachPoint];
    };
    
    if !(isGamePaused) then {
        // propogate fire
        if ((CBA_missionTime - _lastPropogateUpdate) >= BURN_PROPOGATE_UPDATE) then {
            _lastPropogateUpdate = CBA_missionTime;
            if !([ACE_PLAYER] call FUNC(isBurning)) then {
                if ((vehicle _unit) isEqualTo (vehicle ACE_PLAYER)) then {
                    if (0.5 > random 1) then {
                        [QGVAR(burn), [ACE_PLAYER, _intensity * (7 / 8), _instigator]] call CBA_fnc_globalEvent;
                    };
                } else {
                    if ({ (ACE_PLAYER isKindOf "Man") } && { !(_unit isEqualTo ACE_PLAYER) }) then {
                        private _burnCounter = ACE_PLAYER getVariable [QGVAR(burnCounter), 0];
                        if (_distanceToUnit < BURN_PROPOGATE_DISTANCE) then {
                            if (_burnCounter < BURN_PROPOGATE_COUNTER_MAX) then {
                                _burnCounter = _burnCounter + 1;
                            } else {
                                [QGVAR(burn), [ACE_PLAYER, _intensity * (3 / 4), _instigator]] call CBA_fnc_globalEvent;
                            };
                        } else {
                            _burnCounter = 0;
                        };
                        ACE_PLAYER setVariable [QGVAR(burnCounter), _burnCounter];
                    };
                };
            };
        };
    
        // update intensity/fire reactions
        if ((CBA_missionTime - _lastIntensityUpdate) >= INTENSITY_UPDATE) then {
            _lastIntensityUpdate = CBA_missionTime;
            _intensity = _intensity - INTENSITY_LOSS - (rain / 10);
            if (local _unit) then {
                if !(IS_UNCONSCIOUS(_unit)) then {
                    if !(isPlayer _unit) then {
                        private _sdr = _unit getVariable [QGVAR(stopDropRoll), false];
                        if ((_unit isEqualTo vehicle _unit) && (_sdr || ({ 0.05 > random 1 }))) then {
                            _unit setVariable [QGVAR(stopDropRoll), true];
                            if !(_sdr) then {
                                TRACE_1("stop, drop, roll!", _unit);
                                _unit setUnitPos "DOWN";
                                doStop _unit;
                            };
                            // queue up a bunch of animations
                            for "_i" from 0 to 2 do {
                                [_unit, selectRandom ["amovppnemstpsnonwnondnon_amovppnemevasnonwnondl", "amovppnemstpsnonwnondnon_amovppnemevasnonwnondr"], 0] call EFUNC(common,doAnimation);
                            };
                            _intensity = _intensity - (1 / _intensity);
                        } else {
                            private _group = (group _unit);
                            private _vehicle = vehicle _unit;
                            
                            if (_vehicle != _unit) then {
                                TRACE_1("Ejecting", _unit);
                                _unit leaveVehicle _vehicle;
                                unassignVehicle _unit;
                                _unit action ["eject",_vehicle];
                            };
                            _unit disableAI "TARGET";
                            _unit disableAI "AUTOTARGET";

                            // Run away
                            if (leader _group != _unit) then {
                                [_unit] join grpNull;
                            };
                            _unit doMove ((getPosATL _unit) getPos [20 + random 35, floor (random 360)]);
                            _unit setSpeedMode "FULL";
                            _unit setSuppression 1;
                        };
                    } else {
                        if ((animationState _unit) in PRONE_ROLLING_ANIMS) then {
                            // decrease intensity of burn, but if its too high this wont do anything substantial
                            _intensity = _intensity - (1 / _intensity);
                        };
                    };
                
                    if (_unit isEqualTo vehicle _unit) then {
                        if !(currentWeapon _unit isEqualTo "") then {
                            private _gwh = createVehicle ["WeaponHolderSimulated", [0, 0, 0], [], 0, "NONE"];
                            _gwh setPosASL (_unit modelToWorldVisualWorld (_unit selectionPosition "righthand"));
                            
                            private _weapon = currentWeapon _unit;
                            _unit removeWeapon _weapon;
                            _gwh addweaponCargoGlobal [_weapon, 1];
                            
                            _gwh setDir (90 - getDir _unit);
                            _gwh addTorque [random 100, random 100, random 100];
                            
                            private _massGwh = getMass _gwh;
                            private _forceNeededForVelocity = _massGwh * speed _unit;
                            _gwh addForce [(vectorNormalized velocity _unit) vectorMultiply _forceNeededForVelocity, [0, 0, 0]]
                        };
                    };
                    
                    private _soundID = floor (1 + random 15);
                    private _sound = format [QGVAR(scream_%1), _soundID];
                    [QGVAR(playScream), [_sound, _unit]] call CBA_fnc_globalEvent;
                };
                
                // Common burn areas are the hands and face https://www.ncbi.nlm.nih.gov/pubmed/16899341/
                private _woundSelection = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] selectRandomWeighted [0.77, 0.5, 0.8, 0.8, 0.3, 0.3];
                if (GET_PAIN_PERCEIVED(_unit) < (PAIN_UNCONSCIOUS + random 0.2)) then {
                    // keep pain around unconciousness limit to allow for more fun interactions
                    [_unit, _intensity / MAX_INTENSITY, _woundSelection, "burn", _instigator] call EFUNC(medical,addDamageToUnit);
                } else {
                    [_unit, 0.15, _woundSelection, "unknown", _instigator] call EFUNC(medical,addDamageToUnit);
                };
                
                _unit setVariable [QGVAR(intensity), _intensity, true]; // globally sync intensity across all clients to make sure simulation is deterministic
            };
        };
        
        private _burnIndicatorPFH = _unit getVariable [QGVAR(burnUIPFH), -1];
        if (_unit isEqualTo ACE_PLAYER && { _burnIndicatorPFH < 0 }) then {
            _burnIndicatorPFH = [FUNC(burnIndicator), 1, _unit] call CBA_fnc_addPerFrameHandler;
            _unit setVariable [QGVAR(burnUIPFH), _burnIndicatorPFH];
        };
    };
}, 0, [_unit, _intensity, _instigator], {
    // init function
    private _params = _this getVariable "params";
    _params params ["_unit", "_startingIntensity"];
    
    _intensity = _startingIntensity;
    private _unitPos = getPos _unit;
    
    _fireParticle = "#particlesource" createVehicleLocal _unitPos;
    _fireParticle attachTo [_unit, [0, 0, 0]];
    _fireParticle setDropInterval 0.03;
    
    _smokeParticle = "#particlesource" createVehicleLocal _unitPos;
    
    _fireLight = "#lightpoint" createVehicleLocal _unitPos;
    _fireLight setLightIntensity 0;
    _fireLight setLightAmbient [0.8, 0.6, 0.2];
	_fireLight setLightColor [1, 0.5, 0.4];
	_fireLight attachTo [_unit, [0, 0, 0]];
    _fireLight setLightDayLight false;
    
    _lightFlare = "#lightpoint" createVehicleLocal _unitPos;
    _lightFlare setLightIntensity 0;
	_lightFlare setLightColor [1, 0.8, 0.8];
    _lightFlare setLightUseFlare true;
    _lightFlare setLightFlareMaxDistance 100;
    _lightFlare setLightFlareSize 0;
    
    if !(_unit isEqualTo ACE_PLAYER) then {
        private _relativeAttachPoint = (vectorNormalized (_unit worldToModelVisual (getPos ACE_PLAYER))) vectorMultiply 1;
        _relativeAttachPoint set [2, 0.5];
        _lightFlare attachTo [_unit, _relativeAttachPoint];
    } else {
        _lightFlare attachTo [_unit, [0, 0, 0.3]];
    };
    
    if (isServer) then {
        _fireSound = createSoundSource ["Sound_Fire", _unitPos, [], 0];
        _fireSound attachTo [_unit, [0, 0, 0], "destructionEffect1"];
    };
    
    _unit setVariable [QGVAR(burning), true];
    _unit setVariable [QGVAR(intensity), _intensity];
    _unit setVariable [QGVAR(burnUIPFH), -1];
    
    if (local _unit) then {
        if (_unit isEqualTo ACE_PLAYER) then {
            private _burnIndicatorPFH = [FUNC(burnIndicator), 1, _unit] call CBA_fnc_addPerFrameHandler;
            _unit setVariable [QGVAR(burnUIPFH), _burnIndicatorPFH];
        };
        
        private _soundID = floor (1 + random 15);
        private _sound = format [QGVAR(scream_%1), _soundID];
        [QGVAR(playScream), [_sound, _unit]] call CBA_fnc_globalEvent;
    };
    
    _lastIntensityUpdate = 0;
    _lastPropogateUpdate = 0;
}, {
    (_this getVariable "params") params ["_unit"];

    // deinit function
    deleteVehicle _fireParticle;
    deleteVehicle _smokeParticle;
    deleteVehicle _fireLight;
    deleteVehicle _lightFlare;
    deleteVehicle _fireSound;
    
    if (local _unit) then {
        if !(isPlayer _unit) then {
            _unit setUnitPos "AUTO";
            _unit setVariable [QGVAR(stopDropRoll), false];
        };
    };
    _unit setVariable [QGVAR(burning), false];
}, {
    // run condition
    true
}, {
    // exit condition
    (_this getVariable "params") params ["_unit"];
    isNull _unit || { _intensity <= MIN_INTENSITY } || { !([_unit] call FUNC(isBurning)) };
}, ["_intensity", "_fireParticle", "_smokeParticle", "_fireLight", "_fireSound", "_lightFlare", "_lastIntensityUpdate", "_lastPropogateUpdate"]] call CBA_fnc_createPerFrameHandlerObject
