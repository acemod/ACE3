#include "script_component.hpp"

// Handle damage to local vehicles
[QGVAR(hp), FUNC(dispatchHitPart)] call EFUNC(common,addEventHandler);

// Extension dispatch commands
[QGVAR(setAnimationNames), FUNC(setAnimationNames)] call EFUNC(common,addEventHandler);
// Trigger and start fetching results
[FUNC(monitorResultsPFH), 0, []] call CBA_fnc_addPerFrameHandler;

