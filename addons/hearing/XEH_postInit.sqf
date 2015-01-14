#include "script_component.hpp"

GVAR(currentDeafness) = 0;
GVAR(newStrength) = 0;

// Spawn volume updating process
[FUNC(updateVolume), 0.1, [] ] call CBA_fnc_addPerFrameHandler;
