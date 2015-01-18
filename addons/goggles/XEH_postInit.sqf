/*
  Name: XEH_postInit.sqf

  Author: Garth de Wet (LH)

  Description:
  Sets up the glasses mod for usage. Initialises variables and event handlers.
  Shouldn't be called by a user/modder ever. Done by the engine.

  Parameters:
  Nothing

  Returns:
  Nothing
*/
#include "script_component.hpp"
if (!hasInterface) exitWith {};

if isNil(QGAR(UsePP)) then {
  GVAR(UsePP) = true;
};

GVAR(PostProcess) = ppEffectCreate ["ColorCorrections", 1995];
GVAR(PostProcessEyes) = ppEffectCreate ["ColorCorrections", 1992];
GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0,0,0,1],[1,1,1,0]];
GVAR(PostProcessEyes) ppEffectCommit 0;
GVAR(PostProcessEyes) ppEffectEnable false;
GVAR(EffectsActive) = false;
GVAR(Effects) = GLASSESDEFAULT;
GVAR(Current) = "None";
GVAR(EyesDamageScript) = 0 spawn {};
GVAR(FrameEvent) = [false, [false,20]];
GVAR(PostProcessEyes_Enabled) = false;
GVAR(DustHandler) = 0 spawn {};
GVAR(RainDrops) = objNull;

FUNC(CheckGlasses) = {
  if (GVAR(Current) != (goggles ace_player)) then {
    GVAR(Current) = (goggles ace_player);
    ["GlassesChanged",[GVAR(Current)]] call CBA_fnc_localEvent;
  };
};

ace_player addEventHandler ["Explosion", {
  if (alive ace_player) then {
    call FUNC(ApplyDirtEffect);
    if (GETBROKEN) exitWith {};
    if (((_this select 1) call FUNC(GetExplosionIndex)) < getNumber(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_Resistance")) exitWith {};
    if !(ace_player call FUNC(isGogglesVisible)) exitWith {["GlassesCracked",[ace_player]] call CBA_fnc_localEvent;};
    GVAR(Effects) set [BROKEN, true];
    if (getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked") != "" && {cameraOn == ace_player}) then {
      if (call FUNC(ExternalCamera)) exitWith {};
      if (isNull(GLASSDISPLAY)) then {
        150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
      };
      (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked");
    };
    ["GlassesCracked",[ace_player]] call CBA_fnc_localEvent;
  };
}];
ace_player addEventHandler ["Killed",{
  [] spawn {
    sleep 2;
    GVAR(PostProcessEyes) ppEffectEnable false;
    GVAR(Effects) = GLASSESDEFAULT;
    call FUNC(removeGlassesEffect);
    GVAR(EffectsActive)=false;
    ace_player setVariable ["ACE_EyesDamaged", false];
    terminate GVAR(EyesDamageScript);
    terminate GVAR(MainLoop);
    terminate GVAR(DustHandler);
    GVAR(MainLoop) = [] spawn FUNC(checkGoggles);
  };
}];
ace_player addEventHandler ["Fired",{[_this select 0, _this select 1] call FUNC(dustHandler);}];
ace_player AddEventHandler ["Take",{call FUNC(checkGlasses);}];
ace_player AddEventHandler ["Put", {call FUNC(checkGlasses);}];

["GlassesChanged",{
  GVAR(Effects) = GLASSESDEFAULT;

  if (call FUNC(ExternalCamera)) exitWith {call FUNC(RemoveGlassesEffect)};

  if (ace_player call FUNC(isGogglesVisible)) then {
    (_this select 0) call FUNC(applyGlassesEffect);
  } else {
    call FUNC(removeGlassesEffect);
  };
}] call CBA_fnc_addEventHandler;
["GlassesCracked",{
  if (_this select 0 != ace_player) exitWith {};
  ace_player setVariable ["ACE_EyesDamaged", true];
  if !(scriptDone GVAR(EyesDamageScript)) then {
    terminate GVAR(EyesDamageScript);
  };
  GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [0.5,0.5,0.5,0.5],[1,1,1,0]];
  GVAR(PostProcessEyes) ppEffectCommit 0;
  GVAR(PostProcessEyes) ppEffectEnable true;
  GVAR(EyesDamageScript) = [] spawn {
    sleep 25;
    GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
    GVAR(PostProcessEyes) ppEffectCommit 5;
    sleep 5;
    GVAR(PostProcessEyes) ppEffectEnable false;
    ace_player setVariable ["ACE_EyesDamaged", false];
  };
}] call CBA_fnc_addEventHandler;
GVAR(MainLoop) = [] spawn FUNC(CheckGoggles);
