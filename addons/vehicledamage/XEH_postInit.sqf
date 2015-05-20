#include "script_component.hpp"

// Handle damage to local vehicles
[QGVAR(hp), FUNC(dispatchHitPart)] call EFUNC(common,addEventHandler);

// Extension dispatch commands
[QGVAR(setAnimationNames), FUNC(setAnimationNames)] call EFUNC(common,addEventHandler);
[QGVAR(doDamageResults), FUNC(doDamageResults)] call EFUNC(common,addEventHandler);

// Trigger and start fetching results
[FUNC(monitorResultsPFH), 0, []] call CBA_fnc_addPerFrameHandler;



#ifdef DEBUG_DRAW_LINES
// Debug functionality
[QGVAR(draw_face), FUNC(debug_drawFace)] call EFUNC(common,addEventHandler);
[FUNC(debug_drawLinesPFH), 0, []] call CBA_fnc_addPerFrameHandler;

#endif