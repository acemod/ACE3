// by commy2

#define FACTOR_POUND_TO_KILOGRAMM 1/2.2046

private ["_unit", "_weight"];

_unit = _this select 0;

_weight = loadAbs _unit * 0.1;

if (profileNamespace getVariable ["AGM_useImperial", false]) then {
  _weight = format ["%1lb", (round (_weight * 100)) / 100];
} else {
  _weight = format ["%1kg", (round (_weight * FACTOR_POUND_TO_KILOGRAMM * 100)) / 100];
};

_weight
