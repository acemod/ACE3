#include "script_component.hpp"

_unit select 0;

_dragged = _unit getVariable [QEGVAR(dragging,draggedObject), objNull];
_carried = _unit getVariable [QEGVAR(dragging,carriedObject), objNull];
_result = objNull;

if (_dragged != objNull) then {
    _result = _dragged;
} else {
    _result = _carried;
};

_result