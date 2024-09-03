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

GVAR(fortifyTools) = (QUOTE(getNumber (_x >> QQGVAR(fortifyTool)) > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
GVAR(fortifyTools) append (QUOTE(getNumber (_x >> QQGVAR(fortifyTool)) > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});
TRACE_1("",_fortifyTools);

#include "initSettings.inc.sqf"

ADDON = true;
