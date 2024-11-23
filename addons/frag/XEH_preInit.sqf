#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(spallMaterialCache) = uiNamespace getVariable QGVAR(spallMaterialCache);
GVAR(spallInfoCache) = createHashMap;
GVAR(shouldSpallCache) = createHashMap;
GVAR(nextSpallAllowTime) = -1;

GVAR(shouldFragCache) = createHashMap;
GVAR(fragInfoCache) = createHashMap;
GVAR(lastFragTime) = -1;

#include "initSettings.inc.sqf"

GVAR(dev_trackLines) = createHashMap;
GVAR(dev_hitBoxes) = createHashMap;
GVAR(dev_eventSpheres) = [];
GVAR(dev_drawPFEH) = -1;

#ifdef DEBUG_MODE_DRAW
#include "initSettingsDebug.inc.sqf"
#else
GVAR(debugOptions) = false;
GVAR(dbgSphere) = false;
GVAR(drawHitBox) = false;
#endif

if (isServer) then {
    [QGVAR(frag_eh), LINKFUNC(frago)] call CBA_fnc_addEventHandler;
};

ADDON = true;
