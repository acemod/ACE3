// by commy2
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0 select 0;
_target = _this select 0 select 1;

// drop if the player is dead
if !([_unit] call EFUNC(common,isAlive)) exitWith {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed
if !([_target] call EFUNC(common,isAlive)) exitWith {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

// drop if not in dragging anim. This also exits when entering a vehicle.
if !(animationState _unit in DRAG_ANIMATIONS) exitWith {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

if !([_unit] call EFUNC(common,isPlayer)) exitWith {
    [_unit, _target] call FUNC(dropObject);
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};
