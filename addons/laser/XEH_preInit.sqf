#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Laser default variables
ACE_DEFAULT_LASER_CODE = 1111;
ACE_DEFAULT_LASER_WAVELENGTH = 1550;
ACE_DEFAULT_LASER_BEAMSPREAD = 1;

GVAR(laserEmitters) = [] call CBA_fnc_hashCreate;
GVAR(trackedLaserTargets) = [];
GVAR(pfehID) = -1;

ADDON = true;
