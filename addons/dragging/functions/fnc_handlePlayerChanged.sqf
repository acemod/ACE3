// by commy2
#include "script_component.hpp"

private ["_newPlayer", "_oldPlayer"];

_newPlayer = _this select 0;
_oldPlayer = _this select 1;

{
    if (_x getVariable [QGVAR(startDragging), false] || _x getVariable [QGVAR(isDragging), false]) then {
        [_x, _x getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    };

    if (_x getVariable [QGVAR(startCarrying), false] || _x getVariable [QGVAR(isCarrying), false]) then {
        [_x, _x getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry);
    };
} forEach [_newPlayer, _oldPlayer];
