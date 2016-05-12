#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(VanillaLasers) = [];

// Laser default variables
ACE_DEFAULT_LASER_CODE = 1001;
ACE_DEFAULT_LASER_WAVELENGTH = 1550;
ACE_DEFAULT_LASER_BEAMSPREAD = 1;

GVAR(laserEmitters) = HASH_CREATE;

ADDON = true;
