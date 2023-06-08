#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

// prevent execution of anything below on headless clients
if (!hasInterface) exitWith {};

// Initialize all uiNamespace variables
SETUVAR(GVAR(DK10_dlg), displayNull);
