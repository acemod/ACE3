// by commy2
#include "script_component.hpp"

#ifdef DEBUG_ENABLED_DRAGGING
    systemChat format ["%1 dragObjectPFH running", ACE_time];
#endif

private ["_unit", "_target"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;

if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed OR (target moved away from carrier (weapon disasembled))
if ((!([_target] call EFUNC(common,isAlive))) || {(_unit distance _target) > 10}) then {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
