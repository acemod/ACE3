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

["ACE3", localize "STR_ACE_Goggles_WipeGlasses",
{
  if (!(GETVAR(ace_player,ACE_isUnconscious,false))) exitWith {
    call FUNC(clearGlasses);
    true
  };
  false
}, [20, true, true, false], false, "keydown"] call CALLSTACK(cba_fnc_registerKeybind);

if isNil(QGVAR(UsePP)) then {
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
GVAR(DustHandler) = -1;
GVAR(RainDrops) = objNull;
GVAR(RainActive) = false;
GVAR(RainLastLevel) = 0;

FUNC(CheckGlasses) = {
  if (GVAR(Current) != (goggles ace_player)) then {
    GVAR(Current) = (goggles ace_player);
    ["GlassesChanged",[GVAR(Current)]] call EFUNC(common,localEvent);
  };
};

player addEventHandler ["Explosion", {
  if (alive ace_player) then {
    call FUNC(ApplyDirtEffect);
    if (GETBROKEN) exitWith {};
    if (((_this select 1) call FUNC(GetExplosionIndex)) < getNumber(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_Resistance")) exitWith {};
    if !(ace_player call FUNC(isGogglesVisible)) exitWith {["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);};
    GVAR(Effects) set [BROKEN, true];
    if (getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked") != "" && {cameraOn == ace_player}) then {
      if (call FUNC(ExternalCamera)) exitWith {};
      if (isNull(GLASSDISPLAY)) then {
        150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
      };
      (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked");
    };
    ["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);
  };
}];
player addEventHandler ["Killed",{
  GVAR(PostProcessEyes) ppEffectEnable false;
  GVAR(Effects) = GLASSESDEFAULT;
  call FUNC(removeGlassesEffect);
  GVAR(EffectsActive)=false;
  ace_player setVariable ["ACE_EyesDamaged", false];
  terminate GVAR(EyesDamageScript);
  [GVAR(DustHandler)] call CALLSTACK(cba_fnc_removePerFrameHandler);
  GVAR(DustHandler) = -1;
}];
player addEventHandler ["Fired",{[_this select 0, _this select 1] call FUNC(dustHandler);}];
player AddEventHandler ["Take",{call FUNC(checkGlasses);}];
player AddEventHandler ["Put", {call FUNC(checkGlasses);}];

["GlassesChanged",{
  GVAR(Effects) = GLASSESDEFAULT;

  if (call FUNC(ExternalCamera)) exitWith {call FUNC(RemoveGlassesEffect)};

  if (ace_player call FUNC(isGogglesVisible)) then {
    (_this select 0) call FUNC(applyGlassesEffect);
  } else {
    call FUNC(removeGlassesEffect);
  };
}] call EFUNC(common,addEventHandler);
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
}] call EFUNC(common,addEventHandler);
call FUNC(checkGlasses);
[FUNC(CheckGoggles), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(rainEffect), 0.5, []] call CBA_fnc_addPerFrameHandler;
[FUNC(onEachFrame), 0, []] call CBA_fnc_addPerFrameHandler;
