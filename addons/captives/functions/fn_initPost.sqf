// by commy2

private "_unit";

_unit = _this select 0;

// reset status on mission start
if (_unit getVariable ["AGM_isCaptive", false]) then {
  _unit setVariable ["AGM_isCaptive", false];
  [_unit, true] call AGM_Captives_fnc_setCaptive;
};
