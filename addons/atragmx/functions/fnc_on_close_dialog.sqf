#include "script_component.hpp"

uiNamespace setVariable ['ATragMX_Display', nil];
GVAR(active) = false;
[GVAR(DialogPFH)] call cba_fnc_removePerFrameHandler;