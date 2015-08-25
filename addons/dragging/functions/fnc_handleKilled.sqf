// by commy2
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

if (_unit getVariable [QGVAR(startDragging), false] || _unit getVariable [QGVAR(isDragging), false]) then {
    private "_draggedObject";
    _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

    [_unit, _draggedObject] call FUNC(dropObject);
};

if (_unit getVariable [QGVAR(startCarrying), false] || _unit getVariable [QGVAR(isCarrying), false]) then {
    private "_carriedObject";
    _carriedObject = _unit getVariable [QGVAR(carriedObject), objNull];

    [_unit, _carriedObject] call FUNC(dropObject_carry);
};
