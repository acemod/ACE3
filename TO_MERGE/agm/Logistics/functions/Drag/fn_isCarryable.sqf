// by commy2

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

_unit == vehicle _unit &&
{alive _target} &&
{!(_target getVariable ["AGM_disableDrag", false])}
