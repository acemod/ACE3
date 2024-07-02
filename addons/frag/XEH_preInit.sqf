#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

call FUNC(initMaterialCache);

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
#endif

if (isServer) then {
    [QEGVAR(common,setShotParents), {(_this#0) setVariable [QGVAR(shotParent), [_this#1, _this#2]]}] call CBA_fnc_addEventHandler;
};

ADDON = true;
