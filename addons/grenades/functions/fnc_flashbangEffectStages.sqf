/*
* Author: KoffeinFlummi, Pabst Mirror
*
* Handles the different stages of the flash bang effect recovery
*
* Arguments:
* ARRAY[
* 0-ARRAY - PARAMS:
*   0: NUMBER - Stage, controls a case statement
*   1: NUMBER - Time To Wait Until
*   2: VARIES - Stage's Variable
* 1-NUMBER perFrame handle
* Return Value:
* None
*/

#include "script_component.hpp"

private ["_stage", "_waitUntilTime"];

_stage = (_this select 0) select 0;
_waitUntilTime = (_this select 0) select 1;

if (_waitUntilTime > time) exitWith {};

//remove frameEH
[(_this select 1)] call cba_fnc_removePerFrameHandler;

switch (_stage) do {
  case(EFFECT_STAGE_RESETAI): {
    private "_unit";
    _unit = (_this select 0) select 2;
    _unit enableAI "MOVE";
    _unit enableAI "ANIM";
    _unit enableAI "AUTOTARGET";
    _unit enableAI "TARGET";
    _unit enableAI "FSM";
    _unit setSkill (skill _unit * 50);
  };
  case(EFFECT_STAGE_DELETELIGHT): {
    private "_light";
    _light = (_this select 0) select 2;
    deleteVehicle _light;
  };
  case(EFFECT_STAGE_PARTIALRECOVERY): {
    private "_strength";
    _strength = (_this select 0) select 2;
    GVAR(flashbangPPEffectCC) ppEffectAdjust [1,1,0,[1,1,1,0],[0,0,0,1],[0,0,0,0]];
    GVAR(flashbangPPEffectCC) ppEffectCommit (10 * _strength);
  };
  case(EFFECT_STAGE_FULLRECOVERY): {
    GVAR(flashbangPPEffectCC) ppEffectEnable false;
  };
  default {
    TRACE_1("EffectStage Bad Stage", _stage);
  };
};
