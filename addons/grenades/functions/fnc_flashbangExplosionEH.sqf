/*
* Author: KoffeinFlummi
*
* Creates the flashbang effect and knock out AI units.
*
* Arguments:
* 0: The grenade (Object)
*
* Return Value:
* None
*/

#include "script_component.hpp"

private ["_grenade", "_affected", "_strength", "_posGrenade", "_posUnit", "_angleGrenade", "_angleView", "_angleDiff", "_light"];

_grenade = _this select 0;

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

      [FUNC(flashbangEffectStages), 0, [EFFECT_STAGE_RESETAI, (time + (7 * _strength)), _x]] call CBA_fnc_addPerFrameHandler;
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

      _angleView = (eyeDirection player select 0) atan2 (eyeDirection player select 1);
      _angleView = (_angleView + 360) % 360;

      _angleDiff = 180 - abs (abs (_angleGrenade - _angleView) - 180);
      _angleDiff = ((_angleDiff - 45) max 0);

      _strength = _strength - _strength * (_angleDiff  / 135);

      // create flash to illuminate environment
      _light = "#lightpoint" createVehicleLocal getPos _grenade;
      _light setLightBrightness 200;
      _light setLightAmbient [1,1,1];
      _light setLightColor [1,1,1];
      _light setLightDayLight true;

      [FUNC(flashbangEffectStages), 0, [EFFECT_STAGE_DELETELIGHT, (time + (0.1)), _light]] call CBA_fnc_addPerFrameHandler;

      // blind player
      if (_strength > 0.1) then {
        GVAR(flashbangPPEffectCC) ppEffectEnable true;
        GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,(0.8 + _strength) min 1,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
        GVAR(flashbangPPEffectCC) ppEffectCommit 0.01;

        [FUNC(flashbangEffectStages), 0, [EFFECT_STAGE_PARTIALRECOVERY, (time + (7 * _strength)), _strength]] call CBA_fnc_addPerFrameHandler;
        [FUNC(flashbangEffectStages), 0, [ EFFECT_STAGE_FULLRECOVERY, (time + (17 * _strength))]] call CBA_fnc_addPerFrameHandler;
      };
    };
  };
} forEach _affected;
