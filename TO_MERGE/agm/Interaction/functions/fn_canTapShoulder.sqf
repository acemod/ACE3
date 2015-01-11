// by commy2

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

_target isKindOf "CAManBase" &&
{alive _target} &&
{_unit distance _target < 4} &&
{!(_target getVariable ["AGM_isUnconscious", false])}
