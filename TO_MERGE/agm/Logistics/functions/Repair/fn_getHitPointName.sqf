// by commy2

private ["_hitPoint", "_string"];

_hitPoint = _this select 0;

_string = format ["STR_AGM_Repair_%1", _hitPoint];

if (isLocalized _string) then {localize _string} else {_hitPoint}
