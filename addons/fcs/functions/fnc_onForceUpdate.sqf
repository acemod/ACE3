#include "script_component.hpp"

params ["_unit"];

private _vehicle = vehicle _unit;

if !([_unit, _vehicle, []] call CFUNC(canInteractWith)) exitWith {false};
if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

private _turret = [_unit] call CFUNC(getTurretIndex);

[_vehicle, _turret] call FUNC(keyDown);
[_vehicle, _turret] call FUNC(keyUp);
