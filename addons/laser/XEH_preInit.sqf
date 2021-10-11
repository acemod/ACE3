#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Laser default variables
ACE_DEFAULT_LASER_CODE = 1111;
ACE_DEFAULT_LASER_WAVELENGTH = 1550;
ACE_DEFAULT_LASER_BEAMSPREAD = 1;

GVAR(laserEmitters) = createHashMap;
GVAR(trackedLaserTargets) = [];
GVAR(pfehID) = -1;

#include "initSettings.sqf"

ADDON = true;
