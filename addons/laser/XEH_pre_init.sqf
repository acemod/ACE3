#include "script_component.hpp"

PREP(rotateVectLineGetMap);
PREP(rotateVectLine);
PREP(shootRay);
PREP(shootCone);
PREP(checkLos);

PREP(findLaserDesignator);
PREP(findStrongestRay);

PREP(translateToModelSpace);
PREP(translateToWeaponSpace);

PREP(seekerFindLaserSpot);
PREP(laserOn);
PREP(laserOff);
PREP(handleLaserOn);
PREP(handleLaserOff);

PREP(drawVisibleLaserTargets);

PREP(laser_init);

PREP(laserTargetPFH);

ACE_LASERS = [];
ACE_DEFAULT_LASER_CODE = 1001;

GVAR(laserEmitters) = HASH_CREATE;