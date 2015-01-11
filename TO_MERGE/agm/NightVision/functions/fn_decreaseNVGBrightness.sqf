// by commy2

private ["_player", "_vehicle", "_brightness"];

_player = _this select 0;
_vehicle = _this select 1;

_brightness = _player getVariable ["AGM_NVGBrightness", 0];

if (_brightness > -1) then {
  _brightness = round (10 * _brightness - 1) / 10;

  _player setVariable ["AGM_NVGBrightness", _brightness, false];

  AGM_NightVision_ppEffectNVGBrightness ppEffectAdjust [1, 1, _brightness / 4, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
  AGM_NightVision_ppEffectNVGBrightness ppEffectCommit 0;

  [format [localize "STR_AGM_NightVision_NVGBrightness", format ["%1%", _brightness * 100]]] call AGM_Core_fnc_displayTextStructured;
  playSound "AGM_Sound_Click";
};
