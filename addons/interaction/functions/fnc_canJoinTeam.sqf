// by commy2
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {!([_target] call EFUNC(common,isPlayer))}
&& {_target in units group _unit}
