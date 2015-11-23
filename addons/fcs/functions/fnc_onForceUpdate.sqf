#include "script_component.hpp"

params ["_unit"];

private _vehicle = vehicle _unit;

if !([_unit, _vehicle, []] call EFUNC(common,canInteractWith)) exitWith {false};
if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

private _turret = [_unit] call EFUNC(common,getTurretIndex);

[_vehicle, _turret, -1, false] call FUNC(keyDown);
[_vehicle, _turret, -1, false, false] call FUNC(keyUp);
