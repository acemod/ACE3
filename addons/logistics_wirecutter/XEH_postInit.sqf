#include "script_component.hpp"

if (hasInterface) then {
    ["ace_interactMenuOpened", LINKFUNC(interactEH)] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(destroyFence), LINKFUNC(destroyFence)] call CBA_fnc_addEventHandler;
};

GVAR(possibleWirecutters) = call (uiNamespace getVariable [QGVAR(possibleWirecutters), {[]}]);
