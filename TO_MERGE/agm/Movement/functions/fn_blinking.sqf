// by commy2

private "_script_handle";

_script_handle = _this spawn {
  if (!isTouchingGround player) exitWith {};

  _ppEffect = ppEffectCreate ["ColorCorrections", 1240];
  _ppEffect ppEffectEnable true;
  _ppEffect ppEffectForceInNVG true;
  _ppEffect ppEffectAdjust [0, -1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
  _ppEffect ppEffectCommit 0.2;
  sleep 0.2;

  _ppEffect ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0.5]];
  _ppEffect ppEffectCommit 0.2;
  sleep 0.2;

  _ppEffect ppEffectEnable false;
  ppEffectDestroy _ppEffect;
  sleep 2 + random 2;
};
_script_handle
