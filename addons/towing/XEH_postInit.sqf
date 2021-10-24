#include "script_component.hpp"
["MouseButtonDown", LINKFUNC(onMouseButtonDown)] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", LINKFUNC(onMouseButtonUp)] call CBA_fnc_addDisplayHandler;
GVAR(mouseLeft) = false;
GVAR(mouseRight) = false;

GVAR(cancel) = false;
GVAR(canAttach) = false;

if (hasInterface) then {
    // Cancel rope attachment on certain conditions
    ["unit", { GVAR(cancel) = true; }] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", { GVAR(cancel) = true; }] call CBA_fnc_addPlayerEventHandler;
    ["ace_unconscious", { GVAR(cancel) = true; }] call CBA_fnc_addEventHandler;
};

[QGVAR(setTowParent), {
    params ["_parent", "_child"];
    _child setTowParent _parent;
}] call CBA_fnc_addEventHandler;

