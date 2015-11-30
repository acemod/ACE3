#include "script_component.hpp"

uiNamespace setVariable ['ATragMX_Display', nil];
GVAR(active) = false;
[GVAR(DialogPFH)] call CBA_fnc_removePerFrameHandler;