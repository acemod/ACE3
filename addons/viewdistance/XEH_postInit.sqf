#include "script_component.hpp"

[] call FUNC(moduleViewDistance);
if (!hasInterface || !GVAR(enabled)) exitWith {};
[] call FUNC(initViewDistance);