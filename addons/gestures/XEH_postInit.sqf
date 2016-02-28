#include "script_component.hpp"

if (!hasInterface) exitWith {};

// reload mutex, you can't play signal while reloading
GVAR(ReloadMutex) = true;

#include "key.sqf"
