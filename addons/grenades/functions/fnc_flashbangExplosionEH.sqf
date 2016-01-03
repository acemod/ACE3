/*
 * Author: KoffeinFlummi
 * Creates the flashbang effect and knock out AI units.
 *
 * Arguments:
 * 0: The grenade <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [theGrenade] call ace_grenades_fnc_flashbangExplosionEH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_grenade"];

private ["_affected", "_strength", "_posGrenade", "_eyePos", "_losCount", "_eyeDir", "_dirToUnitVector", "_angleDiff", "_light"];

_affected = _grenade nearEntities ["CAManBase", 20];

{
    if (local _x && {alive _x}) then {

        _strength = 1 - ((_x distance _grenade) min 15) / 15;

        TRACE_3("FlashBangEffect Start",_x,(_x distance _grenade),_strength);

        if (_x != ACE_player) then {
            //must be AI
            [_x, true] call EFUNC(common,disableAI);

            _x setSkill (skill _x / 50);

            [{
                params ["_unit"];

                //Make sure we don't enable AI for unconscious units
                if !(_unit getVariable ["ace_isUnconscious", false]) then {
                    [_unit, false] call EFUNC(common,disableAI);
                };

                _unit setSkill (skill _unit * 50);
            }, [_x], 7 * _strength] call EFUNC(common,waitAndExecute);
        } else {
            //Do effects for player
            // is there line of sight to the grenade?
            _posGrenade = getPosASL _grenade;
            _eyePos = eyePos ACE_player; //PositionASL
            _posGrenade set [2, (_posGrenade select 2) + 0.2]; // compensate for grenade glitching into ground

            //Check for line of sight (check 4 points in case grenade is stuck in an object or underground)
            _losCount = {
                !lineIntersects [_posGrenade vectorAdd _x, _eyePos, _grenade, ACE_player]
            } count [[0,0,0], [0,0,0.2], [0.1, 0.1, 0.1], [-0.1, -0.1, 0.1]];

            TRACE_1("Line of sight count (out of 4)",_losCount);
            if (_losCount <= 1) then {
                _strength = _strength / 10;
            };

            // add ace_hearing ear ringing sound effect
            if (isClass (configFile >> "CfgPatches" >> "ACE_Hearing") && {_strength > 0}) then {
                [_x, 20 * _strength] call EFUNC(hearing,earRinging);
            };

            // account for people looking away by slightly
            // reducing the effect for visual effects.
            _eyeDir = (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
            _dirToUnitVector = _eyePos vectorFromTo _posGrenade;
            _angleDiff = acos (_eyeDir vectorDotProduct _dirToUnitVector);

            // from 0-45deg, full effect
            if (_angleDiff > 45) then {
                _strength = _strength - _strength * ((_angleDiff - 45) / 120);
            };

            TRACE_1("Final strength for player",_strength);

            // add ace_medical pain effect:
            if (isClass (configFile >> "CfgPatches" >> "ACE_Medical") && {_strength > 0.1}) then {
                [ACE_player, _strength / 2] call EFUNC(medical,adjustPainLevel);
            };

            // create flash to illuminate environment
            _light = "#lightpoint" createVehicleLocal (getPos _grenade);
            _light setLightBrightness 200;
            _light setLightAmbient [1,1,1];
            _light setLightColor [1,1,1];
            _light setLightDayLight true;

            // delete the light after 0.1 seconds
            [{
                params ["_light"];
                deleteVehicle _light;
            }, [_light], 0.1] call EFUNC(common,waitAndExecute);

            // blind player
            if (hasInterface && {_strength > 0.1}) then {
                GVAR(flashbangPPEffectCC) ppEffectEnable true;
                GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,(0.8 + _strength) min 1,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
                GVAR(flashbangPPEffectCC) ppEffectCommit 0.01;

                //PARTIALRECOVERY - start decreasing effect over time
                [{
                    params ["_strength"];

                    GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,0,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
                    GVAR(flashbangPPEffectCC) ppEffectCommit (10 * _strength);
                }, [_strength], 7 * _strength] call EFUNC(common,waitAndExecute);

                //FULLRECOVERY - end effect
                [{
                    GVAR(flashbangPPEffectCC) ppEffectEnable false;
                }, [], 17 * _strength] call EFUNC(common,waitAndExecute);
            };
        };
    };
    true
} count _affected;
