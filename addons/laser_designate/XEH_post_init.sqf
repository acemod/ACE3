#include "script_component.hpp"

GVAR(trackedLaserTargets) = [];

["LaserTargetW", "init", DFUNC(handleLaserTargetCreation)] call CBA_fnc_addClassEventHandler;

