/*
 * Author: KoffeinFlummi
 * Creates the flashbang effect and knock out AI units.
 *
 * Arguments:
 * 0: The grenade <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [theGrenade] call ace_grenades_fnc_flashbangExplosionEH
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_affected", "_strength", "_posGrenade", "_posUnit", "_angleGrenade", "_angleView", "_angleDiff", "_light"];

PARAMS_1(_grenade);

_affected = _grenade nearEntities ["CAManBase", 50];

{
    if ((local _x) && {alive _x}) then {

        _strength = 1 - ((_x distance _grenade) min 15) / 15;

        if (_x != ACE_player) then {
            //must be AI
            _x disableAI "MOVE";
            _x disableAI "ANIM";
            _x disableAI "AUTOTARGET";
            _x disableAI "TARGET";
            _x disableAI "FSM";
            _x setSkill ((skill _x) / 50);

            [{
                PARAMS_1(_unit);
                _unit enableAI "MOVE";
                _unit enableAI "ANIM";
                _unit enableAI "AUTOTARGET";
                _unit enableAI "TARGET";
                _unit enableAI "FSM";
                _unit setSkill (skill _unit * 50);
            }, [_x], (7 * _strength), 0.1] call EFUNC(common,waitAndExecute);  //0.1 precision is fine for AI
        } else {
            //Do effects for player
            // is there line of sight to the grenade?
            _posGrenade = getPosASL _grenade;
            _posGrenade set [2, (_posGrenade select 2) + 0.2]; // compensate for grenade glitching into ground
            if (lineIntersects [_posGrenade, getPosASL _x, _grenade, _x]) then {
                _strength = _strength / 10;
            };

            // beeeeeeeeeeeeeeeeeeeeeeeeeeeeep
            if (isClass (configFile >> "CfgPatches" >> "ACE_Hearing") and _strength > 0) then {
                [_x, 0.5 + (_strength / 2)] call EFUNC(hearing,earRinging);
            };

            // account for people looking away by slightly
            // reducing the effect for visual effects.
            _posUnit = getPos _x;
            _posGrenade = getPos _grenade;
            _angleGrenade = ((_posGrenade select 0) - (_posUnit select 0)) atan2 ((_posGrenade select 1) - (_posUnit select 1));
            _angleGrenade = (_angleGrenade + 360) % 360;

            _angleView = (eyeDirection ACE_player select 0) atan2 (eyeDirection ACE_player select 1);
            _angleView = (_angleView + 360) % 360;

            _angleDiff = 180 - abs (abs (_angleGrenade - _angleView) - 180);
            _angleDiff = ((_angleDiff - 45) max 0);

            _strength = _strength - _strength * (_angleDiff  / 135);

            // create flash to illuminate environment
            _light = "#lightpoint" createVehicleLocal (getPos _grenade);
            _light setLightBrightness 200;
            _light setLightAmbient [1,1,1];
            _light setLightColor [1,1,1];
            _light setLightDayLight true;

            //Delete the light after 0.1 seconds
            [{
                PARAMS_1(_light);
                deleteVehicle _light;
            }, [_light], 0.1, 0] call EFUNC(common,waitAndExecute);

            // blind player
            if (_strength > 0.1) then {
                GVAR(flashbangPPEffectCC) ppEffectEnable true;
                GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,(0.8 + _strength) min 1,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
                GVAR(flashbangPPEffectCC) ppEffectCommit 0.01;

                //PARTIALRECOVERY - start decreasing effect over time
                [{
                    PARAMS_1(_strength);
                    GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,0,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
                    GVAR(flashbangPPEffectCC) ppEffectCommit (10 * _strength);
                }, [_strength], (7 * _strength), 0] call EFUNC(common,waitAndExecute);

                //FULLRECOVERY - end effect
                [{
                    GVAR(flashbangPPEffectCC) ppEffectEnable false;
                }, [], (17 * _strength), 0] call EFUNC(common,waitAndExecute);
            };
        };
    };
} forEach _affected;
