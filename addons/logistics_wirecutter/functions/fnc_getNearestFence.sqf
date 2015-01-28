#include "script_component.hpp"

private "_nearestFence";
PARAMS_1(_unit);

_nearestFence = objNull;
{
  if ((isNull _nearestFence) && {[_x] call FUNC(isFence)}) then {
    _nearestFence = _x;
  };
} forEach nearestObjects [_unit, [], 5];

_nearestFence
