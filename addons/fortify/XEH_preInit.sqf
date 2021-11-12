#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Init array of build locations at preinit
// Can add anything that would work in inArea (triggers, markers or array format [center, a, b, angle, isRectangle, c])
GVAR(locations) = [];

// Custom deploy handlers
GVAR(deployHandlers) = [];

#include "initSettings.sqf"

ADDON = true;
