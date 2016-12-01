#include "script_component.hpp"

if (!hasInterface) exitWith {};

[] call FUNC(initEffects);
[FUNC(handleEffects), 1, []] call CBA_fnc_addPerFrameHandler;
