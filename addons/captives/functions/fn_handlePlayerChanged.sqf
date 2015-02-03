// by commy2

private ["_unit", "_oldUnit"];

_unit = _this select 0;
_oldUnit = _this select 1;

if (_unit getVariable ["AGM_isCaptive", false]) then {
	showHUD false;
} else {
	showHUD true;
};
