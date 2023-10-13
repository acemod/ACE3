#include "script_component.hpp"
["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", LINKFUNC(onMouseButtonUp)] call CBA_fnc_addDisplayHandler;
GVAR(mouseLeft) = false;
GVAR(mouseRight) = false;

GVAR(cancel) = false;
GVAR(canAttach) = false;

[QGVAR(setTowParent), {
    params ["_parent", "_child"];
    _child setTowParent _parent;
}] call CBA_fnc_addEventHandler;

