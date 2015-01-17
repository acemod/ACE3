// by commy2
#include "script_component.hpp"

private ["_player", "_vehicle", "_brightness"];

_player = _this select 0;
_vehicle = _this select 1;

_brightness = _player getVariable [QGVAR(NVGBrightness), 0];

if (_brightness > -1) then {
  _brightness = round (10 * _brightness - 1) / 10;

  _player setVariable [QGVAR(NVGBrightness), _brightness, false];

  GVAR(ppEffectNVGBrightness) ppEffectAdjust [1, 1, _brightness / 4, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
  GVAR(ppEffectNVGBrightness) ppEffectCommit 0;

  [format [localize "STR_ACE_NightVision_NVGBrightness", format ["%1%", _brightness * 100]]] call EFUNC(common,displayTextStructured);
  playSound "ACE_Sound_Click";
};
