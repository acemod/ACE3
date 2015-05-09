// by commy2
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

alive _target
&& {!(_target getVariable ["ACE_isUnconscious", false])}
&& {side group _unit == side group _target}
&& {group _unit != group _target}
