#include "script_component.hpp"

// Make sure JIPs can see already turned on IR lights
GVAR(units) = allPlayers select {
    _x getVariable [QGVAR(turnedOn), false]
};

[FUNC(updateWeaponLights), 0, []] call CBA_fnc_addPerFrameHandler;
