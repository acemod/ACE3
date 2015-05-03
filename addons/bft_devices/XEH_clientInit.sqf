#include "script_component.hpp"

// prevent execution of anything below on headless clients
if (!hasInterface) exitWith {};

#include "initKeybinds.sqf"