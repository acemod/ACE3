#include "script_component.hpp"
["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", LINKFUNC(onMouseButtonUp)] call CBA_fnc_addDisplayHandler;
GVAR(mouseLeft) = false;
GVAR(mouseRight) = false;

GVAR(cancel) = false;
GVAR(canAttach) = false;

[QGVAR(lockVehicle), {
    params ["_vehicle", "_lock"];
    if (_lock) then {
        _vehicle lock 2;
    } else {
        _vehicle lock 0;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(setTowParent), {
    params ["_parent", "_child"];
    _child setTowParent _parent;
}] call CBA_fnc_addEventHandler;

