/*
 * Author: KoffeinFlummi
 *
 * Creates the flashbang effect locally/knocks out AI units.
 *
 * Arguments:
 * 0: The unit (Object)
 * 1: The grenade (Object)
 *
 * Return Value:
 * None
 */

_this spawn {
  _unit = _this select 0;
  _grenade = _this select 1;

  if (damage _unit >= 1) exitWith {};

  _strength = 1 - ((_unit distance _grenade) min 15) / 15;

  if !(isPlayer _unit) exitWith {
    _unit disableAI "MOVE";
    _unit disableAI "ANIM";
    _unit disableAI "AUTOTARGET";
    _unit disableAI "TARGET";
    _unit disableAI "FSM";
    _unit setSkill (skill _unit / 50);

    sleep (7 * _strength);

    _unit enableAI "MOVE";
    _unit enableAI "ANIM";
    _unit enableAI "AUTOTARGET";
    _unit enableAI "TARGET";
    _unit enableAI "FSM";
    _unit setSkill (skill _unit * 50);
  };

  // is there line of sight to the grenade?
  _posGrenade = getPosASL _grenade;
  _posGrenade set [2, (_posGrenade select 2) + 0.2]; // compensate for grenade glitching into ground
  if (lineIntersects [_posGrenade, getPosASL _unit, _grenade, _unit]) then {
    _strength = _strength / 10;
  };

  // beeeeeeeeeeeeeeeeeeeeeeeeeeeeep
  if (isClass (configFile >> "CfgPatches" >> "AGM_Hearing") and _strength > 0) then {
    [_unit, 0.5 + (_strength / 2)] call AGM_Hearing_fnc_earRinging;
  };

  // account for people looking away by slightly
  // reducing the effect for visual effects.
  _posUnit = getPos _unit;
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

  // blind player
  if (_strength > 0.1) then {
    AGM_Flashbang_CC ppEffectEnable true;
    AGM_Flashbang_CC ppEffectAdjust [1,1,(0.8 + _strength) min 1,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
    AGM_Flashbang_CC ppEffectCommit 0.01;
  };

  sleep 0.1;
  deleteVehicle _light;
  sleep (7 * _strength);

  if (_strength > 0.1) then {
    AGM_Flashbang_CC ppEffectAdjust [1,1,0,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
    AGM_Flashbang_CC ppEffectCommit (10 * _strength);

    sleep (10 * _strength);

    AGM_Flashbang_CC ppEffectEnable false;
  };
};
