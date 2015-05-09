#include "script_component.hpp"

PREP(rotateVectLineGetMap);
PREP(rotateVectLine);
PREP(shootRay);
PREP(shootCone);
PREP(checkLos);

PREP(findStrongestRay);

PREP(onLaserDesignatorDraw);

PREP(seekerFindLaserSpot);
PREP(laserOn);
PREP(laserOff);
PREP(handleLaserOn);
PREP(handleLaserOff);

PREP(drawVisibleLaserTargets);

PREP(laser_init);
PREP(vanillaLaserSeekerHandler);
PREP(laserTargetPFH);

GVAR(VanillaLasers) = [];

PREP(unitTurretCanLockLaser);
PREP(keyLaserCodeUp);
PREP(keyLaserCodeDown);

// Laser default variables
ACE_DEFAULT_LASER_CODE = 1001;
ACE_DEFAULT_LASER_WAVELENGTH = 1550;
ACE_DEFAULT_LASER_BEAMSPREAD = 1;

GVAR(laserEmitters) = HASH_CREATE;