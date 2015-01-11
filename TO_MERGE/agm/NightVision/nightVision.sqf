//by commy2

private ["_currentVehicle", "_currentTurret", "_currentHMD", "_grainSetting", "_blurSetting"];

_currentView = "";
_currentVehicle = objNull;
_currentTurret = [-1];
_currentHMD = "";

while {true} do {
  AGM_NightVision_ppEffect ppEffectEnable false;
  AGM_NightVision_ppEffectBlur ppEffectEnable false;
  AGM_NightVision_ppEffectRadialBlur ppEffectEnable false;
  AGM_NightVision_ppEffectNVGBrightness ppEffectEnable false;

  waitUntil {currentVisionMode AGM_player == 1};

  AGM_NightVision_ppEffect ppEffectEnable true;
  AGM_NightVision_ppEffectBlur ppEffectEnable true;
  AGM_NightVision_ppEffectRadialBlur ppEffectEnable true;
  AGM_NightVision_ppEffectNVGBrightness ppEffectEnable true;

  waitUntil {
    // any updates?
    if (hmd AGM_player != _currentHMD || {cameraView != _currentView} || {vehicle AGM_player != _currentVehicle} || {!(_currentTurret isEqualTo []) && {AGM_player != _currentVehicle turretUnit _currentTurret}}) then {
      _currentHMD = hmd AGM_player;
      _currentView = cameraView;
      _currentVehicle = vehicle AGM_player;
      _currentTurret = [AGM_player] call AGM_Core_fnc_getTurretIndex;

      private ["_config", "_fnc_isUsingHMD"];
      _config = configFile >> "CfgVehicles" >> typeOf _currentVehicle;

      _fnc_isUsingHMD = {
        if (_currentView != "GUNNER") exitWith {true};  // asume hmd usage outside of gunner view

        if (AGM_player == driver _currentVehicle) exitWith {
          !("NVG" in getArray (_config >> "ViewOptics" >> "visionMode"));
        };

        private "_turretConfig";
        _turretConfig = [_config, _currentTurret] call AGM_Core_fnc_getTurretConfigPath;
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
      if (_currentVehicle == AGM_player || _fnc_isUsingHMD) then {
        _grainSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "AGM_NightVision_grain");
        _blurSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "AGM_NightVision_blur");
        _radBlurSetting = getNumber (configFile >> "CfgWeapons" >> _currentHMD >> "AGM_NightVision_radBlur");

        AGM_NightVision_ppEffect ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
        AGM_NightVision_ppEffect ppEffectCommit 0;
        AGM_NightVision_ppEffectBlur ppEffectAdjust [_blurSetting];
        AGM_NightVision_ppEffectBlur ppEffectCommit 0;
        AGM_NightVision_ppEffectRadialBlur ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
        AGM_NightVision_ppEffectRadialBlur ppEffectCommit 0;

      // in vehicle and not using hmd
      } else {
        _grainSetting = _currentVehicle getVariable ["AGM_NightVision_grain", getNumber (_config >> "AGM_NightVision_grain")];
        _blurSetting = _currentVehicle getVariable ["AGM_NightVision_blur", getNumber (_config >> "AGM_NightVision_blur")];
        _radBlurSetting = _currentVehicle getVariable ["AGM_NightVision_radBlur", getNumber (_config >> "AGM_NightVision_radBlur")];

        AGM_NightVision_ppEffect ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
        AGM_NightVision_ppEffect ppEffectCommit 0;
        AGM_NightVision_ppEffectBlur ppEffectAdjust [_blurSetting];
        AGM_NightVision_ppEffectBlur ppEffectCommit 0;
        AGM_NightVision_ppEffectRadialBlur ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
        AGM_NightVision_ppEffectRadialBlur ppEffectCommit 0;
      };
    };

    // Detect if curator interface is open and disable effects
    if (!isNull findDisplay 312) then {
      AGM_NightVision_ppEffect ppEffectEnable false;
      AGM_NightVision_ppEffectBlur ppEffectEnable false;
      AGM_NightVision_ppEffectRadialBlur ppEffectEnable false;
      AGM_NightVision_ppEffectNVGBrightness ppEffectEnable false;

      waitUntil {isNull findDisplay 312};

      AGM_NightVision_ppEffect ppEffectEnable true;
      AGM_NightVision_ppEffectBlur ppEffectEnable true;
      AGM_NightVision_ppEffectRadialBlur ppEffectEnable true;
      AGM_NightVision_ppEffectNVGBrightness ppEffectEnable true;
    };

    currentVisionMode AGM_player != 1
  };
};
