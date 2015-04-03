#include "script_component.hpp"

GVAR(enabled) = false;
GVAR(time) = 0;
GVAR(position) = [0,0,0];

#include "initKeybinds.sqf"

// Register event for global updates
[QGVAR(forceUpdate), FUNC(onForceUpdate)] call ace_common_fnc_addEventHandler