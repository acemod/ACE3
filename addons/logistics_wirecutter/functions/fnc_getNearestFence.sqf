/* fnc_getNearestFence.sqf
*
* Author: PabstMirror
*
* Gets nearest fence within 5 meters to the unit.
*
* Argument:
* 0: OBJECT - Unit to search for fence objects arround
*
* Return value:
* OBJECT - Nearest object that is a fence, objNull if none found.
*/
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
