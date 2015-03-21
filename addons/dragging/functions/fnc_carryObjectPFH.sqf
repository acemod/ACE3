// by commy2
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;

// drop if the crate is destroyed
if !([_target] call EFUNC(common,isAlive)) then {
    [_unit, _target] call FUNC(dropObject_carry);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
