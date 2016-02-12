#include "script_component.hpp"

GVAR(trackedLaserTargets) = [];
GVAR(pfhuid) = [];

["LaserTargetBase", "init", DFUNC(handleLaserTargetCreation)] call CBA_fnc_addClassEventHandler;

