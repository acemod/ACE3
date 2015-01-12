//by commy2
#include "script_component.hpp"


private ["_currentVehicle", "_currentTurret", "_currentHMD", "_grainSetting", "_blurSetting"];

_currentView = "";
_currentVehicle = objNull;
_currentTurret = [-1];
_currentHMD = "";

while {true} do {
  GVAR(ppEffectFilmGrain) ppEffectEnable false;
  GVAR(ppEffectBlur) ppEffectEnable false;
  GVAR(ppEffectRadialBlur) ppEffectEnable false;
  GVAR(ppEffectNVGBrightness) ppEffectEnable false;

  waitUntil {currentVisionMode ACE_player == 1};

  GVAR(ppEffectFilmGrain) ppEffectEnable true;
  GVAR(ppEffectBlur) ppEffectEnable true;
  GVAR(ppEffectRadialBlur) ppEffectEnable true;
  GVAR(ppEffectNVGBrightness) ppEffectEnable true;

  waitUntil {
    // any updates?
    if (hmd ACE_player != _currentHMD || {cameraView != _currentView} || {vehicle ACE_player != _currentVehicle} || {!(_currentTurret isEqualTo []) && {ACE_player != _currentVehicle turretUnit _currentTurret}}) then {
      _currentHMD = hmd ACE_player;
      _currentView = cameraView;
      _currentVehicle = vehicle ACE_player;
      _currentTurret = [ACE_player] call EFUNC(common,getTurretIndex);

      private ["_config", "_fnc_isUsingHMD"];
      _config = configFile >> "CfgVehicles" >> typeOf _currentVehicle;

      _fnc_isUsingHMD = {
        if (_currentView != "GUNNER") exitWith {true};  // asume hmd usage outside of gunner view

        if (ACE_player == (driver _currentVehicle)) exitWith {
          !("NVG" in getArray (_config >> "ViewOptics" >> "visionMode"));
        };

        private "_turretConfig";
        _turretConfig = [_config, _currentTurret] call EFUNC(core,getTurretConfigPath);
        _turretConfig = _turretConfig >> "OpticsIn";

        private "_result";
        _result = true;
        for "_index" from 0 to (count _turretConfig - 1) do {
          if ("NVG" in getArray (_turretConfig select _index >> "visionMode")) exitWith {_result = false};
          true
        };

        _result
      };

      // on foot or in vehicle using hmd
      if ((_currentVehicle == ACE_player) || _fnc_isUsingHMD) then {
        _grainSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "ACE_NightVision_grain");
        _blurSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "ACE_NightVision_blur");
        _radBlurSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "ACE_NightVision_radBlur");

        GVAR(ppEffectFilmGrain) ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
        GVAR(ppEffectFilmGrain) ppEffectCommit 0;
        GVAR(ppEffectBlur) ppEffectAdjust [_blurSetting];
        GVAR(ppEffectBlur) ppEffectCommit 0;
        GVAR(ppEffectRadialBlur) ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
        GVAR(ppEffectRadialBlur) ppEffectCommit 0;

      // in vehicle and not using hmd
      } else {

        _grainSetting = _currentVehicle getVariable ["ACE_NightVision_grain", getNumber (_config >> "ACE_NightVision_grain")];
        _blurSetting = _currentVehicle getVariable ["ACE_NightVision_blur", getNumber (_config >> "ACE_NightVision_blur")];
        _radBlurSetting = _currentVehicle getVariable ["ACE_NightVision_radBlur", getNumber (_config >> "ACE_NightVision_radBlur")];

        GVAR(ppEffectFilmGrain) ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
        GVAR(ppEffectFilmGrain) ppEffectCommit 0;
        GVAR(ppEffectBlur) ppEffectAdjust [_blurSetting];
        GVAR(ppEffectBlur) ppEffectCommit 0;
        GVAR(ppEffectRadialBlur) ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
        GVAR(ppEffectRadialBlur) ppEffectCommit 0;
      };
    };

    // Detect if curator interface is open and disable effects
    if (!isNull findDisplay 312) then {
      GVAR(ppEffectFilmGrain) ppEffectEnable false;
      GVAR(ppEffectBlur) ppEffectEnable false;
      GVAR(ppEffectRadialBlur) ppEffectEnable false;
      GVAR(ppEffectNVGBrightness) ppEffectEnable false;

      waitUntil {isNull findDisplay 312};

      GVAR(ppEffectFilmGrain) ppEffectEnable true;
      GVAR(ppEffectBlur) ppEffectEnable true;
      GVAR(ppEffectRadialBlur) ppEffectEnable true;
      GVAR(ppEffectNVGBrightness) ppEffectEnable true;
    };

    currentVisionMode ACE_player != 1
  };
};
