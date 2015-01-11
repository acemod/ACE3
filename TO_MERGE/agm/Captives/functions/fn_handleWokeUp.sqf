// by commy2

private "_unit";

_unit = _this select 0;

if (_unit getVariable ["AGM_isCaptive", false] && {vehicle _unit == _unit}) then {
  [_unit] call AGM_Core_fnc_fixLoweredRifleAnimation;
  [_unit, "AGM_AmovPercMstpScapWnonDnon", 0] call AGM_Core_fnc_doAnimation;
};
