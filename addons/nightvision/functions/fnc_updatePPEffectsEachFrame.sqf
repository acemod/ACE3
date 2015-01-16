//by commy2, PabstMirror

#include "script_component.hpp"
#define MODE_NVG_OFF 0
#define MODE_NVG_ON 1
#define MODE_NVG_ONZEUS 2

_fnc_isUsingHMD = {
  if (GVAR(lastFrameView) != "GUNNER") exitWith {true};  // asume hmd usage outside of gunner view

  if (ACE_player == (driver _currentVehicle)) exitWith {
    !("NVG" in getArray (_config >> "ViewOptics" >> "visionMode"));
  };

  private ["_result", "_turretConfig", "_turretConfigOpticsIn"];
  _result = true;
  _turretConfig = [_config, GVAR(lastFrameTurret)] call EFUNC(common,getTurretConfigPath);
  _turretConfigOpticsIn = _turretConfig >> "OpticsIn";

  if (isClass _turretConfigOpticsIn) then {
    for "_index" from 0 to (count _turretConfig - 1) do {
      if ("NVG" in getArray (_turretConfig select _index >> "visionMode")) exitWith {_result = false};
    };
  } else {
    //No OpticsIn usualy means RCWS, still need to test on more vehicles
    _result = false;
  };
  _result
};

private ["_currentVehicle", "_grainSetting", "_blurSetting", "_radBlurSetting", "_config"];
_currentVehicle = vehicle ACE_player;

switch (GVAR(currentMode)) do {
case (MODE_NVG_OFF): {
    if ((currentVisionMode ACE_player) == 1) then {
      GVAR(currentMode) = MODE_NVG_ON;
      GVAR(ppEffectFilmGrain) ppEffectEnable true;
      GVAR(ppEffectBlur) ppEffectEnable true;
      GVAR(ppEffectRadialBlur) ppEffectEnable true;
      GVAR(ppEffectNVGBrightness) ppEffectEnable true;
    };
  };
case (MODE_NVG_ON): {
    if ((currentVisionMode ACE_player) == 0) then {
      GVAR(currentMode) = MODE_NVG_OFF;
      GVAR(ppEffectFilmGrain) ppEffectEnable false;
      GVAR(ppEffectBlur) ppEffectEnable false;
      GVAR(ppEffectRadialBlur) ppEffectEnable false;
      GVAR(ppEffectNVGBrightness) ppEffectEnable false;
    };
    if (!isNull findDisplay 312) then {
      GVAR(currentMode) = MODE_NVG_ONZEUS;
      GVAR(ppEffectFilmGrain) ppEffectEnable false;
      GVAR(ppEffectBlur) ppEffectEnable false;
      GVAR(ppEffectRadialBlur) ppEffectEnable false;
      GVAR(ppEffectNVGBrightness) ppEffectEnable false;
    } else {
      if (((hmd ACE_player) != GVAR(lastFrameHMD)) ||
          {cameraView != GVAR(lastFrameView)} ||
          {_currentVehicle != GVAR(lastFrameVehicle)} ||
          {!(([ACE_player] call EFUNC(common,getTurretIndex)) isEqualTo GVAR(lastFrameTurret))}) then {

        GVAR(lastFrameHMD) = hmd ACE_player;
        GVAR(lastFrameView) = cameraView;
        GVAR(lastFrameVehicle) = _currentVehicle;
        GVAR(lastFrameTurret) = [ACE_player] call EFUNC(common,getTurretIndex);
        _config = configFile >> "CfgVehicles" >> typeOf _currentVehicle;

        if ((_currentVehicle == ACE_player) || _fnc_isUsingHMD) then {
          _grainSetting = getNumber (configFile >> "CfgWeapons" >> GVAR(lastFrameHMD) >> "ACE_NightVision_grain");
          _blurSetting = getNumber (configFile >> "CfgWeapons" >> GVAR(lastFrameHMD) >> "ACE_NightVision_blur");
          _radBlurSetting = getNumber (configFile >> "CfgWeapons" >> GVAR(lastFrameHMD) >> "ACE_NightVision_radBlur");
          TRACE_3("New NVG Settings From Player NVG",_grainSetting,_blurSetting,_radBlurSetting)
        } else {
          _grainSetting = _currentVehicle getVariable ["ACE_NightVision_grain", getNumber (_config >> "ACE_NightVision_grain")];
          _blurSetting = _currentVehicle getVariable ["ACE_NightVision_blur", getNumber (_config >> "ACE_NightVision_blur")];
          _radBlurSetting = _currentVehicle getVariable ["ACE_NightVision_radBlur", getNumber (_config >> "ACE_NightVision_radBlur")];
          TRACE_3("New NVG Settings From Vehicle",_grainSetting,_blurSetting,_radBlurSetting)
        };

        GVAR(ppEffectFilmGrain) ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
        GVAR(ppEffectFilmGrain) ppEffectCommit 0;
        GVAR(ppEffectBlur) ppEffectAdjust [_blurSetting];
        GVAR(ppEffectBlur) ppEffectCommit 0;
        GVAR(ppEffectRadialBlur) ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
        GVAR(ppEffectRadialBlur) ppEffectCommit 0;
      };
    };
  };
case (MODE_NVG_ONZEUS): {
    if (isNull findDisplay 312) then {
      if ((currentVisionMode ACE_player) == 0) then {
        GVAR(currentMode) = MODE_NVG_OFF;
      } else {
        GVAR(currentMode) = MODE_NVG_ON;
        GVAR(ppEffectFilmGrain) ppEffectEnable true;
        GVAR(ppEffectBlur) ppEffectEnable true;
        GVAR(ppEffectRadialBlur) ppEffectEnable true;
        GVAR(ppEffectNVGBrightness) ppEffectEnable true;
      };
    };
  };
};
