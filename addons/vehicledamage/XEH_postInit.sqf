#include "script_component.hpp"

// Handle damage to local vehicles
[QGVAR(hp), FUNC(dispatchHitPart)] call EFUNC(common,addEventHandler);

[] call FUNC(initializeExtension);
[FUNC(monitorResultsPFH), 0, []] call CBA_fnc_addPerFrameHandler;