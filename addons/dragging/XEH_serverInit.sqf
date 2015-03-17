// by commy2
#include "script_component.hpp"

// release object on hard disconnection.
addMissionEventHandler ["HandleDisconnect", {
    private "_unit";

    _unit = _this select 0;

    if (_unit getVariable [QGVAR(isDragging), false]) then {
        [_unit, _unit getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    };
}];
