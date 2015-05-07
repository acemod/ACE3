#include "script_component.hpp"

_item = _this select 0 select 0;

if (_item != player getVariable [QEGVAR(dragging,draggedObject), objNull]) then {
	_item setVariable [QGVAR(canInteract), objNull, true];
};