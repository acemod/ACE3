#include "script_component.hpp"

if (hasInterface) then {
    ["ace_interactMenuOpened", {_this call FUNC(interactEH)}] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    [QGVAR(destroyFence), {_this call FUNC(destroyFence)}] call CBA_fnc_addEventHandler;
};
