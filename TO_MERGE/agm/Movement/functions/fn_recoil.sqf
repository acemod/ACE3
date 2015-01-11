// by commy2

private "_script_handle";

_script_handle = _this spawn {
  _recoilFactor = _this select 0;
  _recoverThreshold = _this select 1;

  player setUnitRecoilCoefficient (_recoilFactor * unitRecoilCoefficient player);

  waitUntil {getFatigue player < _recoverThreshold};

  player setUnitRecoilCoefficient (_recoilFactor / unitRecoilCoefficient player);
};
_script_handle
